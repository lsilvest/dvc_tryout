```
dvc run -n train -m metrics/metrics.json -o models/model.RDS --plots plots/fit.png "Rscript train/regression.R" 
```
