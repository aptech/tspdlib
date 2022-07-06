new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

// With constant
model = 1;
stat = qr_kss(y, model, 0.7); 

// With constant and trend
model = 2;
stat = qr_kss(y, model, 0.7); 

