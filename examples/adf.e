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

format /m1 /rd 8,4;

/*
** 0 = No deterministic component
** 1 = With constant
** 2 = With constant and trend
*/
model = 0;                  

{ ADFtau, ADFp } = ADF(y, model, pmax, ic);

"ADF &  lag no deterministic component     ";;ADFtau~ADFp;

/*
** 0 = No deterministic component
** 1 = With constant
** 2 = With constant and trend
*/
model = 1;                  

{ ADFtau, ADFp } = ADF(y, model, pmax, ic);

"ADF &  lag with constant                  ";;ADFtau~ADFp;

/*
** 0 = No deterministic component
** 1 = With constant
** 2 = With constant and trend
*/
model = 2;

{ ADFtau, ADFp } = ADF(y, model, pmax, ic);

"ADF &  lag with constant and trend        ";;ADFtau~ADFp;
