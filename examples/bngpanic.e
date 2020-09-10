new;
cls;
library tspdlib;

// Date dimensions
N = 24;
T = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

/*
** Set maximum number of lags for ds
** 0 = no lags
*/
pmax = 5;     

// Max no of factors for PCA
kmax = 4;

// Information Criterion for optimal number of factors
ic = 2;

/*
** Model with constant
*/
model = 0;
{ ADFe, pval, lags, Pe, nf } = BNG_PANIC(y, pmax, kmax, model, ic);


/*
** Model with constant and trend
*/
model = 1;
{ ADFe, pval, lags, Pe, nf } = BNG_PANIC(y, pmax, kmax, model, ic);

