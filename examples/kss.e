new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y");

/*
** Using the defaults 
** for maximum number of lags
** and information criterion
*/

// Set model to demean data
model = 1;                  
{ KSStau, KSSp, cvKSS } = KSS(y, model);
