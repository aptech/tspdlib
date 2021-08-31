new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_examples.csv", "Y");

{ lm_tau, lm_p, lm_cv }  = lm(y);
