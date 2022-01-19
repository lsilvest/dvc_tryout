# Just a set of useful commands
```
dvc exp show

dvc run -n train -m metrics/metrics.json -o models/model.RDS --plots plots/fit.png "Rscript train/regression.R" 
```

 ──────────────────────────────────────────────────────────────── 
  Experiment                Created       RMSE   train.modeltype  
 ──────────────────────────────────────────────────────────────── 
  workspace                 -          0.81885   lmer             
  mixed_effect_model        11:06 PM    3.3512   -                
  └── 14979b3 [exp-64401]   11:50 PM   0.81885   lmer             
 ──────────────────────────────────────────────────────────────── 
 
 ──────────────────────────────────────────────────────────────── 
  Experiment                Created       RMSE   train.modeltype  
 ──────────────────────────────────────────────────────────────── 
  workspace                 -           3.3512   lm               
  mixed_effect_model        11:53 PM   0.81885   lmer             
  └── 8786f92 [exp-9e6a6]   11:53 PM    3.3512   lm               
 ────────────────────────────────────────────────────────────────  
