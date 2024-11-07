new;
library tspdlib;

// Load data
data = loadd(getGAUSSHome("pkgs/tspdlib/examples/pd_brics.gdat"));

/*
** Note that the data needs
** to be wide format so we
** need to reshape the data
*/
// Set up dfwider conversion for 'lco2' variable
names_from = "Country";
values_from = "lco2";

// Get y data
y = dfwider(data[., "Year" "Country" "lco2"], names_from, values_from);
y = asDate(y, "%Y", "Year");

/*
** The independent variable is 'ly' and we need to
** select all columns that contain ly data
*/
// Set up dfwider conversion for 'lco2' variable
names_from = "Country";
values_from = "ly";

// Separate x and convert to wide data
// using same "Country" and names_from
// as 'ly' variable as values_from
x = dfwider(data[., "Year" "Country" "ly"], names_from, values_from);
x = delcols(x, 1);

// Deterministic component
// 0 = no shift,
// 1 = level shift,
// 2 = regime shift
model = 1;

// Estimate breaks and test for cointegration
{ brks, lmn, nf } = pd_coint_wedgerton(y, x, model);


