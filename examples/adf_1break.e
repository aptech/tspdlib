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

// Trimming rate
trimm = 0.10;             

/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 1;    

// Innovational outlier
outlier = 1;
{ ADF_min, tb1, p, cv } = ADF_1break(y, model, outlier, pmax, ic, trimm);
  
/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/

// Innovational outlier
outlier = 1;

model = 2;                  
{ ADF_min, tb1, p, cv } = ADF_1break(y, model, outlier, pmax, ic, trimm);

