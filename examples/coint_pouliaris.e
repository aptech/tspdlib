new;
cls;
library tspdlib;

// Load dataset
data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv", 
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

// Time variable
T = rows(data);

/*
** Using the defaults 
** bandwidth and
** LR variance computation method.
*/

model = 0;
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model);

model = 1;
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model);

model = 2;
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model);
