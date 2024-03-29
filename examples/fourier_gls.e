new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");

/*
** Use defaults for 
** maximum number of lags for ds,
** information criterion, 
** and maximum number of Fourier
*/


// With constant
model = 1;
{ GLSstat, f, p, cv } = Fourier_GLS(y, model);

// With constant and trend
model = 2;
{ GLSstat, f, p, cv } = Fourier_GLS(y, model);

// Find F-stat
{ f_stat, p_val } = fourierGLSFTest(y[., "Y"], model, f, p);
