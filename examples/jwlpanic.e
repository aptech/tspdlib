new;
cls;
library tspdlib;

// Date dimensions
N = 24;
T = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

/*
** Model with constant
*/
model = 1;
{ Pa_ca, Pb_ca, PMSB_ca } = JWR_PANICCA(y, model);

/*
** Model with constant and trend
*/
model = 2;
{ Pa_ca, Pb_ca, PMSB_ca } = JWR_PANICCA(y, model);
