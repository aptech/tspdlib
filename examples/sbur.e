new;
cls;

library tspdlib_dv;

/*
** This section loads data
** note this test is a time series test
** so we load one column of data
*/
// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");

/*
** This section sets parameters 
** for testing.
*/
// Set up control structure
struct sburControl msburCtl;
msburCtl = sburControlCreate();

// Number of breaks
msburCtl.numberBreaks = 5;

// Model to use
model = 3;

/*
** Estimation method
** when = 1 we use the algorithm, 
** and = 0 brut force
*/
msburCtl.estimation = 1;
msburCtl.maxIters = 20;

// Output structure
struct sburOut msOut;
msOut = sbur_gls(y, model, msburCtl);
