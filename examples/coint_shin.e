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

// Leads & Lags for DOLS estimation
q = int(4*(t/100)^(2/9));

model = 0;
{ CIols, CIdols, cv } = coint_shin(y, x, model, bwl, varm, q);
   
model = 1;
{ CIols, CIdols, cv } = coint_shin(y, x, model, bwl, varm, q);

model = 2;
{ CIols, CIdols, cv } = coint_shin(y, x, model, bwl, varm, q);

  
