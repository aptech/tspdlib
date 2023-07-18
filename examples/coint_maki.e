/*
** This example program tests for cointegration 
** with alternatives hypothesis up to m structural breaks
*/
new;
cls; 
library tspdlib_dv;

// Load dataset
data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv", 
                            ". + date($Date, '%b-%y')");

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
