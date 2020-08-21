new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Maximum number of lags for ds; 
** 0=no lags
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
** 0 = No deterministic component
** 1 = With constant
** 2 = With constant and trend
*/
model = 0;                  
{ ADFtau, ADFp, cvADF }  = ADF(y, model, pmax, ic);

/*
** 0 = No deterministic component
** 1 = With constant
** 2 = With constant and trend
*/
model = 1;                  
{ ADFtau, ADFp, cvADF } = ADF(y, model, pmax, ic);

/*
** 0 = No deterministic component
** 1 = With constant
** 2 = With constant and trend
*/
model = 2;
{ ADFtau, ADFp, cvADF } = ADF(y, model, pmax, ic);
