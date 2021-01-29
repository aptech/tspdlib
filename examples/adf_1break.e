new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

// Model 1: break in level  
// Default innovational outlier
// Default 8 maximum lags
// Default t-stat information criterion
// Default trimming rate of 0.15
model = 1;    

// Call test
{ ADF_min, tb1, p, cv } = ADF_1break(y, model);
  
// Model 1: break in level  
// Additive outlier
// Default 8 maximum lags
// Default t-stat information criterion
// Default trimming rate of 0.15
outlier = 2;
model = 1;                  

// Call test
{ ADF_min, tb1, p, cv } = ADF_1break(y, model, outlier);

// Model 2: break in level and trend
// Default innovational outlier
// Default 8 maximum lags
// Default t-stat information criterion
// Default trimming rate of 0.15
model = 2;    

// Call test
{ ADF_min, tb1, p, cv } = ADF_1break(y, model);

