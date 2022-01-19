library(data.table)
library(here)
library(rjson)
library(ggplot2)
library(lme4)
library(lmerTest)
library(yaml)


load_params <- function() {
    "Updates FULL_PARAMS with the values in params.yaml and returns all as a dictionary"
    yaml.load_file(here("params.yaml"))
}
    

## apply a simple linear model:
params <- load_params()

population <- fread(here("data", "population.csv"))

if (params$train$modeltype == "lmer") {
    model <- lmer(y ~ x + (x | ID), population)
} else if (params$train$modeltype == "lm") {
    model <- lm(y ~ x, population)
} else {
    stop(paste("unknown modeltype", params$train$modeltype))
}


res <- summary(model)


RSS <- c(crossprod(res$residuals))
RMSE <- sqrt(RSS / length(res$residuals))

## three outputs:

## 1. the trained model
saveRDS(model, here("models", "model.RDS"))

## 2. metrics
metrics <- list(comment="naive run", RMSE=RMSE)
metrics_json <- toJSON(metrics)
write(metrics_json, here("metrics", "metrics.json"))

## 3. plot

## Now the plot is a bit more involved as we need to facet to look at each ID:
if (params$train$modeltype == "lmer") {
    ab_lines <- as.data.table(coef(model)$ID)
    setnames(ab_lines, "(Intercept)", "Intercept")
    ab_lines[, ID := 1:.N]

    g <- 
        ggplot(population, aes(x=x, y=y)) + 
        geom_point() +
        geom_abline(aes(intercept=Intercept, slope=x), data=ab_lines, color="red") +
        facet_wrap("ID") +
        ggtitle("Mixed effect model y ~ x + (x | ID)")
} else if (params$train$modeltype == "lm") {
    g <-
        ggplot(model$model, aes_string(x = names(model$model)[2], y = names(model$model)[1])) + 
        geom_point() +
        stat_smooth(method = "lm", col = "red") +
        ggtitle("Straight linear model y ~ x")
} else {
    stop(paste("unknown modeltype", params$train$modeltype))
}

ggsave(here("plots", "fit.png"), g, width=8, height=6)

