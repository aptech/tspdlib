new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

{ LMstat, f, p, cv} = Fourier_LM(y);
