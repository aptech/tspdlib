new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

// Panel stationarity test with level shifts
model = 1;
{ Nkpss, FZk, pval } = PDfzk(y, model, 4);

// Panel stationarity test with level shifts
model = 2;
{ Nkpss, FZk, pval } = PDfzk(y, model, 4);

