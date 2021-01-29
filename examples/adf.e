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

// Default model
// No deterministic term
// Default pmax = 8
// Default t-stat information criterion    
model = 0;
{ ADFtau, ADFp, cvADF }  = ADF(y, model);

// Constant only
// Default pmax = 8
// Default t-stat information criterion  
model = 1;                  
{ ADFtau, ADFp, cvADF } = ADF(y, model);

// Constant and trend
// Default pmax = 8
// Default t-stat information criterion  
model = 2;
{ ADFtau, ADFp, cvADF } = ADF(y, model);
