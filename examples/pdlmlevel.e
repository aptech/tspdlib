new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

// Run panel LM test with level shifts
"Panel LM test with level shifts";
model = 1;

// Maximum number of lags
pmax = 12;

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
nbreak = 0;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLMlevel(y, 1, pmax, ic, trimm, nbreak);

// One break
nbreak = 1;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLMlevel(y, 1, pmax, ic, trimm, nbreak);

// Two breaks
nbreak = 2;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLMlevel(y, 1, pmax, ic, trimm, nbreak);

