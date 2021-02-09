new;
cls;
library tspdlib;

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
