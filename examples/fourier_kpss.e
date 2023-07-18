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
{ KPSS, k, cv } = Fourier_KPSS(y, model);

// With constant and trend
model = 2;
{ KPSS, k, cv } = Fourier_KPSS(y, model);

// Find F-stat
{ f_stat, p_val } = fourierKPSSFTest(y[., "Y"], model, k);

