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

/*
** 1 = With constant
** 2 = With constant and trend
*/
model = 1;
{ tauRALS, p2, cv } = RALSADF(y, model, pmax, ic);

/*
** 1 = With constant
** 2 = With constant and trend
*/
model = 2;
{ tauRALS, p2, cv } = RALSADF(y, model, pmax, ic);

