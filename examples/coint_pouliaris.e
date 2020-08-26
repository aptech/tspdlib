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

// Long-run consistent variance estimation method
varm = 3;

// Bandwidth for kernel estimator
bwl = round(4 * (T/100)^(2/9));  

model = 0;
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);

model = 1;
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);

model = 2;
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);
