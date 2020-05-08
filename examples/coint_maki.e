/*
** This example program tests for cointegration 
** with alternatives hypothesis up to m structural breaks
*/
new;
cls; 
library tspdlib;

// Set fname to name of dataset
fname = "nelsonplosser.dta";

// Add the full path to this code file
// to the front of 'fname'
fname = __FILE_DIR $+ fname;

// Load three variables from the dataset
datap = loadd(fname, "m + bnd + sp500");

// Remove all rows with missing values
datap = packr(datap);


// Set the maximum number of breaks
m = 2;

/*
** Set the model
**   0: level shift
**   1: level shift with trend
**   2: regime shifts 
**   3: Trend and Regime shifts
*/
model = 2;

/*
** Set the trimming parameter
**   This should be a percentage between
**   0 and 1. 0.05 represents 5%
*/
trimm = 0.05;

/* 
** Set lagoption
**   0: lag=0 
**   1: t-sig criterion 
*/
lagoption = 1;

// Perform test
call coint_maki(datap, m, model, trimm, lagoption);
