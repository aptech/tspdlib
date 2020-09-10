new;
cls;
library tspdlib;

// Date dimensions
N = 24;
T = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

// Max no of factors for PCA
kmax = 4;

// Information Criterion for optimal number of factors
ic = 2;

/*
** Model with constant and trend
*/
model = 1;
{ Pa_pc, Pb_pc, PMSB_pc } = BNG_PANICnew(y, kmax, model, ic);

/*
** Model with constant and trend
*/
model = 2;
{ Pa_pc, Pb_pc, PMSB_pc } = BNG_PANICnew(y, kmax, model, ic);
