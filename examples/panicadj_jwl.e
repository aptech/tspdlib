new;
cls;
library tspdlib;

// Date dimensions
N = 24;
T = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

// Model with constant
model = 1;
{ Ze, Ze_ba } = JWL_PANICadj(y, model);

// Model with constant and trend
model = 2;
{ Ze, Ze_ba } = JWL_PANICadj(y, model);
