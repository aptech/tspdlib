new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");

/*
** Use defaults for
** bandwidth,
** LR variance computation,
** information criterion,
** and maximum number of Fourier
*/


// With constant
model = 1;
{ KSS_stat1, p, k } = Fourier_KSS(y, model);
{ test_boot, cv_boot } = Fourier_KSS_bootstrap(y, model); 

// With constant and trend
model = 2;
{ KSS_stat2, p, k } = Fourier_KSS(y, model);
