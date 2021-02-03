new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

{ tauRALS, p2, cv } = RALSLM(y);
