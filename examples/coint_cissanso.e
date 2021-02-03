new;
cls;
library tspdlib;


// Load dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

/*
** Using the defaults 
** for bandwidth,
** LR variance computation method,
** trimming rate, and number of lags
** and leads in DOLS.
*/
model = 1;
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model);

model = 2; 
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model);

model = 3;
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model);

model = 4; 
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model);
