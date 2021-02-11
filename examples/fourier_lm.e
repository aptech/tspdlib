new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y");

{ LMstat, f, p, cv} = Fourier_LM(y);
