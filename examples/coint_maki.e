/*
** This example program tests for cointegration 
** with alternatives hypothesis up to m structural breaks
*/
new;
cls; 
library tspdlib;

// Load dataset
data = loadd(__FILE_DIR $+ "tscoint_full.dat");
data = setcoldateformats(data, "%m/%Y", "Date");

// Set the maximum number of breaks
m = 3;

/*
** Set the model
**   0: level shift
**   1: level shift with trend
**   2: regime shifts 
**   3: Trend and Regime shifts
*/
model = 1;


// Perform test
call coint_maki(data, m, model);
