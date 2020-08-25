new;
cls;
library tspdlib;

// Load the dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

T = rows(data);

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic = 2; 

//Maximum number of lags 
pmax = 12;  

// Trimming rate
trimm = 0.10;             

// Long-run consistent variance estimation method
varm = 3;

// Bandwidth for kernel estimator
bwl = round(4 * (T/100)^(2/9));  

model = 1;
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa}=
    coint_ghansen(y, x, model, bwl, ic, pmax, varm, trimm);

model = 2; 
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model, bwl, ic, pmax, varm, trimm);
 
model = 3;
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model, bwl, ic, pmax, varm, trimm);

model = 4; 
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model, bwl, ic, pmax, varm, trimm);
