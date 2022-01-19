library(data.table)
library(ggplot2)
library(here)


gen_subject <- function(x_start, intercept, subject_n, subject_slope) {
    subject <- data.table(x=x_start:(x_start+subject_n-1))
    noise <- rnorm(subject_n, 0, subject_n/10)
    subject[, y := intercept + subject_slope * x  + noise]
    subject[]
}


gen_population <- function(population_n, subject_n) {
    ## we generate data with a uniform start from 1 on the x-axis, and
    ## with a decreasing intercept:
    
    decrease_intercept_slope <- -2
    subject_slope <- 1
    
    ## generate the population params:
    population_params <- data.table(ID=as.factor(1:population_n),
                                    x_start=as.integer(runif(population_n, min=0, max=2 * subject_n)),
                                    intercept_intercept=subject_n + rpois(population_n, lambda=subject_n/3),
                                    subject_slope=subject_slope + rnorm(population_n, 0, 0.2),
                                    subject_n = as.integer(runif(population_n, 3, subject_n)))
    population_params[, intercept := x_start * decrease_intercept_slope + intercept_intercept + 20]

    population_params[, gen_subject(x_start, intercept, subject_n, subject_slope), by=ID]
}


population_n <- 20
subject_n <- 7
population <- gen_population(population_n, subject_n)


ggplot(population, aes(x=x, y=y)) + geom_point() + ylim(0, subject_n*5)
ggplot(population, aes(x=x, y=y, group=ID, color=ID)) + geom_line() + ylim(0, subject_n*5)

fwrite(population, here("data", "population.csv"))
