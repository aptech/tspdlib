new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", ". + date($Date, '%b-%y')");

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
nbreak = 0;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLMtrend(y, 2, pmax, ic, trimm, nbreak);

// One break 
nbreak = 1;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLMtrend(y, 2, pmax, ic, trimm, nbreak);

// Two breaks
nbreak = 2;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLMtrend(y, 2, pmax, ic, trimm, nbreak);

