new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y");

// With constant
model = 1;                  
{ GLStau, GLSp, cvGLS } = DFGLS(y, model);

// With constant and trend
model = 2;
{ GLStau, GLSp, cvGLS } = DFGLS(y, model);
