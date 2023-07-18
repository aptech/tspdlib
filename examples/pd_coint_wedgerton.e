new;
library tspdlib;

// Load data
dat = loadd(__FILE_DIR $+ "pd_brics.gdat");

// This panel has 5 countries
N = 5;

/*
** Note that the data needs 
** to be wide format so we 
** need to reshape the data
*/
// Get x data
y = reshape(dat[., "lco2"], N, rows(dat)/N)';

// Separate y
x = reshape(dat[., "ly"], N, rows(dat)/N)';

// Get year
year = asDate(unique(dat[., "Year"]), "%Y");


// Deterministic component
// 0 = no shift,
// 1 = level shift,
// 2 = regime shift
model = 1;

// Estimate breaks and test for cointegration
{ brks, lmn, nf } = pd_coint_wedgerton(year~y, x, model);


