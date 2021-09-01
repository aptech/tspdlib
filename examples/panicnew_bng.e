new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/PDe.dat");

/*
** Default
** information criterion
** and maximum number of factors. 
*/

// Model with constant and trend
model = 1;
{ Pa_pc, Pb_pc, PMSB_pc } = BNG_PANICnew(y, model);

// Model with constant and trend
model = 2;
{ Pa_pc, Pb_pc, PMSB_pc } = BNG_PANICnew(y, model);
