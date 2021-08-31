new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"PDe.dat");

// Model with constant
model = 1;
{ Ze, Ze_ba } = JWL_PANICadj(y, model);

// Model with constant and trend
model = 2;
{ Ze, Ze_ba } = JWL_PANICadj(y, model);
