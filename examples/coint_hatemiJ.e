new;
cls;
library tspdlib;

// Load dataset
data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_coint.csv", 
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

/*
** Using the defaults 
** for information criterion, bandwidth,
** LR variance computation method,
** maximum number of lags,
** and trimming rate.
*/

          
// Two breaks
{ ADF_min, TB1adf, TB2adf, Zt_min, TB1zt, TB2zt, Za_min, TB1za, TB2za, cvADFZt, cvZa } =
    coint_hatemiJ(y, x);
