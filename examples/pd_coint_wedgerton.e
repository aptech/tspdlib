new;
library tspdlib_dv;

// Load data
dat = loadd(__FILE_DIR $+ "pd_brics.gdat");

// This panel has 5 countries
N = 5;

// Get x data
y = reshape(dat[., "lco2"], 5, rows(dat)/5)';

// Separate y
x = reshape(dat[., "ly"], 5, rows(dat)/5)';

// Get year
year = asDate(unique(dat[., "Year"]), "%Y");


// Deterministic component
// 0 = no shift,
// 1 = level shift,
// 2 = regime shift
mod = 1;

{ brks, lmn, nf } = pd_coint_wedgerton(year~y, x, mod);


