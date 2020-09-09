new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Maximum number of lags for ds; 
** 0 = no lags
*/
pmax = 12;                 

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic = 3;                 

/*
** With constant
*/
model = 1;                  
{ GLStau, GLSp, cvGLS } = DFGLS(y, model, pmax, ic);

/*
** With constant and trend
*/
model = 2;
{ GLStau, GLSp, cvGLS } = DFGLS(y, model, pmax, ic);
