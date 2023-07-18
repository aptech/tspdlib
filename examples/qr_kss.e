new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

// With constant
model = 1;
{ stat1, cv1 } = qr_kss(y, model, 0.7); 

// With constant and trend
model = 2;
{ stat2, cv2 } = qr_kss(y, model, 0.7); 

