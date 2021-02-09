new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

// Model with constant
model = 1;
{ Ze, Ze_ba } = JWL_PANICadj(y, model);

// Model with constant and trend
model = 2;
{ Ze, Ze_ba } = JWL_PANICadj(y, model);
