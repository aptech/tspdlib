new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

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

// Trimming rate
trimm = 0.10;

format /m1 /rd 8,4;

/*
** 1=Model A: break in level
** 2=Model C: break in level and trend
*/
model = 1;
{ LM_min, tb1, p, lambda, cv } = LM_1break(y, model, pmax, ic, trimm);

/*
** 1=Model A: break in level
** 2=Model C: break in level and trend
*/
model = 2;
{ LM_min, tb1, p, lambda, cv } = LM_1break(y, model, pmax, ic, trimm);
