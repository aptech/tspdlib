new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

// Constant
model = 1;
{ kpss, cvKPSS } = lmkpss(y, model);

// Constant and trend
model = 2;
{ kpss, cvKPSS } = lmkpss(y, model);
