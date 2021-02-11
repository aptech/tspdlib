new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y");

{ lm_tau, lm_p, lm_cv }  = lm(y);
