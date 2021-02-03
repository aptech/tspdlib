new;
cls;
library tspdlib;

// Load the dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

/*
** Using the defaults 
** for information criterion, bandwidth,
** LR variance computation method,
** and trimming rate.
*/

model = 1;
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa}=
    coint_ghansen(y, x, model);

model = 2; 
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model);
 
model = 3;
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model);

model = 4; 
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model);
