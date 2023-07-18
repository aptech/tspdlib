new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y");

// Run test with defaults
{ LMstat, f, p, cv} = Fourier_LM(y);
