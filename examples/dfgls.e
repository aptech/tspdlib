new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Use defaults
** maximum number of lags and
**information criterion.
*/
ic = 3;                 

/*
** With constant
*/
model = 1;                  
{ GLStau, GLSp, cvGLS } = DFGLS(y, model);

/*
** With constant and trend
*/
model = 2;
{ GLStau, GLSp, cvGLS } = DFGLS(y, model);
