new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

// With constant
model = 1;
stat = quantileADF(y, model, 0.7); 

// With constant and trend
model = 2;
stat = quantileADF(y, model, 0.7); 

