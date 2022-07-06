new;
cls;
library tspdlib_dv;

// Load dataset
data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv", 
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");

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
