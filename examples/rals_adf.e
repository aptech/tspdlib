new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"TSe.dat");

// With constant
model = 1;
{ tauRALS, p2, cv } = RALSADF(y, model);

// With constant and trend
model = 2;
{ tauRALS, p2, cv } = RALSADF(y, model);

