new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

/*
** Maximum number of lags for ds;
** 0=no lags
*/
pmax = 12;

/*
** Information Criterion:
** 1=Akaike;
** 2=Schwarz;
** 3=t-stat sign.
*/
ic = 3;

// Quantile
tau   = 0.1;

// Turn printing on
_print= "true";

// With constant
model = 1;
stat = quantileADF(y, model, tau); 

// With constant and trend
model = 2;
stat = quantileADF(y, model, tau); 

