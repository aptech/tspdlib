new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "ts_full.dat");
y = setcoldateformats(y, "%m/%Y", "Date");

// Break in level
model = 1;
{ KPSS, tb1, lambda, cv } = KPSS_1break(y, model);

// Break in level and trend
model = 2;
{ KPSS, tb1, lambda, cv } = KPSS_1break(y, model);


