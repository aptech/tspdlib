new;
cls;
library tspdlib;

// Load the dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

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
