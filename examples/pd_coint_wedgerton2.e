new;
library tspdlib;

/*
** This example loads data that is already in wide format. 
** It demonstrates using GAUSS data cleaning tools to 
** select the relevant columns for this cointegration test
*/
data = loadd(__FILE_DIR $+ "brics_wide_data.gdat");

// Get column names
colnames = getColnames(data);
/*
** For this test we will use:
**   1. 'lco2' variable as the dependent variable
**   2. 'ly' variable as the independent variable
*/

// Get names of columns that contain 'lco2' data
mask = startswith(colnames, "lco2");
y_names = selif(colnames, mask);

// Get y data
y = data[., "Year" ]~data[., y_names];
y = asDate(y, "%Y", "Year");

// Get names of columns that contain 'ly' data
mask = startswith(colnames, "ly");
x_names = selif(colnames, mask);

// Get y data
x = data[., x_names];

// Deterministic component
// 0 = no shift,
// 1 = level shift,
// 2 = regime shift
model = 1;

// Estimate breaks and test for cointegration
{ brks, lmn, nf } = pd_coint_wedgerton(y, x, model);


