# Just a set of useful commands
```
dvc exp show

dvc exp run --set-param train.modeltype=lmer

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
 
 ──────────────────────────────────────────────────────────────────── 
  Experiment                Created           RMSE   train.modeltype  
 ──────────────────────────────────────────────────────────────────── 
  workspace                 -              0.81885   lmer             
  mixed_effect_model        Jan 18, 2022   0.81885   lmer             
  ├── 8b9fb44 [exp-64401]   12:05 AM       0.81885   lmer             
  ├── 1e4a055 [exp-44136]   12:05 AM        3.3512   lm               
  └── 8786f92 [exp-9e6a6]   Jan 18, 2022    3.3512   lm               
 ──────────────────────────────────────────────────────────────────── 

 ──────────────────────────────────────────────────────────────── 
  Experiment                Created       RMSE   train.modeltype  
 ──────────────────────────────────────────────────────────────── 
  workspace                 -           3.7131   lm               
  mixed_effect_model        12:08 AM   0.81885   lmer             
  ├── b299c8e [exp-1afcb]   12:22 AM    3.7131   lm               
  ├── ae48dd9 [exp-44136]   12:18 AM    3.3512   lm               
  └── 82f8c4b [exp-9e6a6]   12:10 AM    3.3512   lm               
 ──────────────────────────────────────────────────────────────── 
