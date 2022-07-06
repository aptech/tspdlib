new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");

/*
** Using the defaults 
** for maximum number of lags,
** information criterion,
** innovational outlier,
** and trimming rate. 
*/

// Include break in level
model = 0;    

// Implement test
{ ADFGLS_min, p, PT_min, MZa_min, MZt_min, MSB_min, MPT_min, s2, 
tb1_min, tb2_min, lambda1, lambda2, cvPT, cvMPT, cvMZt, cvDFGLS, cvMSB, cvMZa} = gls_2breaks(y, model);

// Include break in trend
model = 1;    

// Implement test
{ADFGLS_min, p, PT_min, MZa_min, MZt_min, MSB_min, MPT_min, s2,
tb1_min, tb2_min, lambda1, lambda2, cvPT, cvMPT, cvMZt, cvDFGLS, cvMSB, cvMZa} = gls_2breaks(y, model);

// Include break in level and trend
model = 2;    

// Implement test
{ ADFGLS_min, p, PT_min, MZa_min, MZt_min, MSB_min, MPT_min, s2,
 tb1_min, tb2_min, lambda1, lambda2, cvPT, cvMPT, cvMZt, cvDFGLS, cvMSB, cvMZa} = gls_2breaks(y, model);

