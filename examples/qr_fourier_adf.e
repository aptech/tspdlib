new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

/*
** Use defaults for 
** maximum number of lags for Dy,
** Fourier frequency
** and printing
*/

// With constant
model = 1;
qr_adf_stat = QR_Fourier_ADF(y, model, 0.7);
{ test_boot, cv }  = QR_Fourier_ADF_bootstrap(y, model, 0.7);


// With constant and trend
model = 2;
qr_adf_stat = QR_Fourier_ADF(y, model, 0.7);

