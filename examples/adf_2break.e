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
{ ADF_min, tb1, tb2, p, cv } = ADF_2breaks(y, model, pmax, ic, trimm);
    
/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 2;                  
{ ADF_min, tb1, tb2, p, cv } = ADF_2breaks(y, model, pmax, ic, trimm);

