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

  
