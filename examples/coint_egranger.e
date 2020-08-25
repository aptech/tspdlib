new;
cls;
library tspdlib;

// Load the dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic = 2; 

//Maximum number of lags 
pmax = 12;  

model = 0;
{ tau, cvADF } = coint_egranger(y, x, model, pmax, ic);
  
model = 1;
{ tau, cvADF } = coint_egranger(y, x, model, pmax, ic);


model = 2;
{ tau, cvADF } = coint_egranger(y, x, model, pmax, ic);
