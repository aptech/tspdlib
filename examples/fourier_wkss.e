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

// Run Fourier Wavelet ADF test
{ FWADFstat, f, p } = Fourier_WKSS(y, model);



