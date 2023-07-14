new;
cls;
library tspdlib_dv;

// Load dataset
data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv", 
                            ". + date($Date, '%b-%y')");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

/*
** Using the defaults 
** for information criterion
** and maximum number of lags.
*/

model = 0;
{ tau, cvADF } = coint_egranger(y, x, model);
  
model = 1;
{ tau, cvADF } = coint_egranger(y, x, model);

model = 2;
{ tau, cvADF } = coint_egranger(y, x, model);
