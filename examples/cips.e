new;
cls;
library tspdlib;

// Date dimensions
N    = 24;
T    = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

// CADF and Modidied CADF tests

// Set up model
// 1=constant, 2= linear trend
model = 1;

// Max lags for ADF regression
pmax = 4;

// Information Criterion:
// 1 = Akaike
// 2 = Schwarz
// 3 = t-stat significance
ic  = 3;
{ Ncadf, Nlm, Nmcadf, Nlags, pcadf, pmcadf } = cips(y, model, pmax, ic);
