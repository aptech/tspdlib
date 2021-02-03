new;
cls;
library tspdlib;

// Date dimensions
N = 24;
T = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

/*
** Using the defaults 
** for maximum number of lags,
** information criterions,
** and maximum number of factors. 
*/

/*
** Model with constant
*/
model = 0;
{ ADFe, pval, lags, Pe, nf } = BNG_PANIC(y, model);
