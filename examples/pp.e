new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

// No deterministic component
model = 0;
{ Zt, Za, cvZt, cvZa } = PP(y, model);

// With constant
model = 1;
{ Zt, Za, cvZt, cvZa } = PP(y, model);

// With constant and trend
model = 2;
{ Zt, Za, cvZt, cvZa } = PP(y, model);
