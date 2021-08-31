new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_examples.csv", "Y");

// Constant
model = 1;
{ kpss, cvKPSS } = lmkpss(y, model);

// Constant and trend
model = 2;
{ kpss, cvKPSS } = lmkpss(y, model);
