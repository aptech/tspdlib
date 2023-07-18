new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y");

/*
** Using the defaults 
** for maximum number of lags
** and information criterion
*/

// No deterministic components 
model = 0;
{ ADFtau, ADFp, cvADF }  = ADF(y, model);

// Constant only
model = 1;                  
{ ADFtau, ADFp, cvADF } = ADF(y, model);

// Constant and trend 
model = 2;
{ ADFtau, ADFp, cvADF } = ADF(y, model);

/*
** Increasing maximum number of lags 
** to 12 and using default
** information criterion
*/

// No deterministic components 
model = 0;

// Change maximum lags
pmax = 12;
{ ADFtau, ADFp, cvADF } = ADF(y, model, pmax);


/*
** Increasing maximum number of lags 
** to 12 and using 
** Akaike information criterion
*/

// No deterministic components 
model = 0;

// Change maximum lags
pmax = 12;

// Change information criterion
ic = 1;
{ ADFtau, ADFp, cvADF } = ADF(y, model, pmax, ic);
