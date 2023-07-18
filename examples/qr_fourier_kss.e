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
qr_kss_stat = QR_Fourier_KSS(y, model, 0.7);

// Bootstrap critical values
{  test_boot, cv_boot } = QR_Fourier_KSS_bootstrap(y, model, 0.7);

// With constant and trend
model = 2;
qr_kss_stat = QR_Fourier_KSS(y, model, 0.7);


