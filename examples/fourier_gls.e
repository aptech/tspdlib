new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "ts_full.dat");
y = setcoldateformats(y, "%m/%Y", "Date");

/*
** Use defaults for 
** maximum number of lags for ds,
** information criterion, 
** and maximum number of Fourier
*/


// With constant
model = 1;
{ GLSstat, f, p, cv } = Fourier_GLS(y, model);

// With constant and trend
model = 2;
{ GLSstat, f, p, cv } = Fourier_GLS(y, model);
