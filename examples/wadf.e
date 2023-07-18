new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y");

/*
** Using the defaults 
** for maximum number of lags
** and information criterion
*/

// Set model to demean data
model = 1;                  
{ WADFtau, WADFp } = WADF(y, model);
