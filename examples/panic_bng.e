new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/PDe.dat");

/*
** Using the defaults 
** for maximum number of lags,
** information criterions,
** and maximum number of factors. 
*/

/*
** Model with constant
*/
model = 1;
{ ADFe, pval, lags, Pe, nf } = BNG_PANIC(y, model);
