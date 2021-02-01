new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

// Model 1: break in level  
model = 1;      
{ ADF_min, tb1, p, cv, b, se } = ADF_1break_est(y, model);

// Model 1: break in level
// Additive outlier
outlier = 2;  
{ ADF_min, tb1, p, cv, b, se } = ADF_1break_est(y, model, outlier);

// Model 2: break in level and trend
model = 2;                  
{ ADF_min, tb1, p, cv, b, se } = ADF_1break_est(y, model);

// Model 21: break in level and trend
// Additive outlier
outlier = 2;  
{ ADF_min, tb1, p, cv, b, se } = ADF_1break_est(y, model, outlier);

