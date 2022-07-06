new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

{ tauRALS, p2, cv } = RALSLM(y);
