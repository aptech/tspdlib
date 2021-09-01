new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/PDe.dat");

// CADF and Modified CADF tests
/*
** Using the defaults 
** for maximum number of lags
** and information criterions,
*/

// Set up model
model = 1;
{ Ncadf, Nlm, Nmcadf, Nlags, pcadf, pmcadf } = cips(y, model);

// Set up model
model = 2;
{ Ncadf, Nlm, Nmcadf, Nlags, pcadf, pmcadf } = cips(y, model);
