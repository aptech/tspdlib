new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_examples.csv", "Y + date($Date, '%b-%y')");

/*
** Use defaults for 
** maximum number of lags for ds,
** information criterion, 
** and maximum number of Fourier
*/

//With constant
model = 1;
{ ADFstat, f, p, cv } = Fourier_ADF(y, model);


//With constant and trend
model = 2;
{ ADFstat, f, p, cv } = Fourier_ADF(y, model);

