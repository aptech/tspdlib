new;
cls;
library tspdlib;

// Load dataset
data = loadd(__FILE_DIR $+ "tscoint_full.dat");
data = setcoldateformats(data, "%m/%Y", "Date");

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
