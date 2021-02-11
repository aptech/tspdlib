new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y + date($Date, '%b-%y')");

// Break in level
model = 1;
{ LM_min, tb1, p, lambda, cv } = LM_1break(y, model);

// Break in level and trend
model = 2;
{ LM_min, tb1, p, lambda, cv } = LM_1break(y, model);
