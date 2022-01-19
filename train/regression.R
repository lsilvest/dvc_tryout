library(data.table)
library(here)
library(rjson)
library(ggplot2)


population <- fread(here("data", "population.csv"))

## apply a simple linear model:
model <- lm(y ~ x, population)
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
g <- ggplot(model$model, aes_string(x = names(model$model)[2], y = names(model$model)[1])) + 
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    ggtitle("Straight linear model y ~ x")

ggsave(here("plots", "fit.png"), g, width=8, height=6)

