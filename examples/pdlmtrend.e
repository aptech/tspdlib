new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "pd_full.csv", "Y1 + Y2 + Y3 + Y4 + Y5 + Y6 + Y7 + Y8 + Y9 + Y10 + Y11 + Y12 + Y13 + Y14 + Y15 + Y16 + Y17 + Y18 + Y19 + Y20 + Y21 + Y22 + Y23 + Y24 + date($Date, '%b-%y')");

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

