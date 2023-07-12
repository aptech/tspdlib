new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", ". + date($Date, '%b-%y')");

/*
** Classical panel stationarity test
*/
// With constant
model = 1;
{ Nkpss, W, P, Pm, Z} = pd_stationary(y, model);

// With constant and trend
model = 2;
{ Nkpss, W, P, Pm, Z} = pd_stationary(y, model);

/*
** Cross-section approach panel stationarity test 
*/

// Set test
test = "ca";

// With constant
model = 1;

{ Nkpss, W, P, Pm, Z} = pd_stationary(y, model, test);

// With constant and trend
model = 2;
{ Nkpss, W, P, Pm, Z} = pd_stationary(y, model, test);

/*
** Cross-section approach panel stationarity test 
** with smooth breaks
*/

// Set test
test = "fourier";

// With constant
model = 1;

{ Nkpss, W, P, Pm, Z} = pd_stationary(y, model, test);

// With constant and trend
model = 2;
{ Nkpss, W, P, Pm, Z} = pd_stationary(y, model, test);

/*
** PANIC approach panel stationarity test 
*/

// Set test
test = "panic";

// With constant
model = 1;

{ Nkpss, W, P, Pm, Z} = pd_stationary(y, model, test);

// With constant and trend
model = 2;
{ Nkpss, W, P, Pm, Z} = pd_stationary(y, model, test);
