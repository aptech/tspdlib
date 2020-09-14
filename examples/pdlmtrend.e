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

/*
** Information Criterion:
** 1=Akaike;
** 2=Schwarz;
** 3=t-stat sign.
*/
ic = 3;

// Trimming rate
trimm = 0.10;

// One break
nbreak = 1;
{ Nlm, Ntb, Np, PDlm, pval } = PDLMtrend(y, 2, pmax, ic, trimm, nbreak);

// Two breaks
nbreak = 2;
{ Nlm, Ntb, Np, PDlm, pval } = PDLMtrend(y, 2, pmax, ic, trimm, nbreak);

