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
** for bandwidth,
** LR variance computation method,
** and number of lags
** and leads in DOLS.
*/
model = 0;
{ CIols, CIdols, cv } = coint_shin(y, x, model);
   
model = 1;
{ CIols, CIdols, cv } = coint_shin(y, x, model);

model = 2;
{ CIols, CIdols, cv } = coint_shin(y, x, model);

  
