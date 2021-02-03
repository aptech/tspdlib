new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Using the defaults 
** for maximum number of lags,
** information criterion,
** innovational outlier,
** and trimming rate. 
*/

// Include break in level
model = 1;    

// Implement test
{ ADF_min, tb1, p, cv } = ADF_1break(y, model);

// Run model with additive outlier
outlier = 2;

// Implement test
{ ADF_min, tb1, p, cv } = ADF_1break(y, model, outlier);
end;
// Include break in level and trend
model = 2;    

// Call test
{ ADF_min, tb1, p, cv } = ADF_1break(y, model);

// Run model with additive outlier
outlier = 2;

// Implement test
{ ADF_min, tb1, p, cv } = ADF_1break(y, model, outlier);
