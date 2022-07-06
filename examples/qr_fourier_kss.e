new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");

/*
** Use defaults for 
** maximum number of lags for Dy,
** Fourier frequency
** and printing
*/

// With constant
model = 1;
qr_kss = QR_Fourier_KSS(y, model, 0.7);


// With constant and trend
model = 2;
qr_kss = QR_Fourier_KSS(y, model, 0.7);


