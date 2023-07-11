new;
cls;
library tspdlib_dv;

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
test = "FADF";
{ KSS_stat, k, cv } = Fourier_KSS(y, model, test);

// With constant and trend
model = 2;
{ KSS_stat, k, cv } = Fourier_KSS(y, model, test);
