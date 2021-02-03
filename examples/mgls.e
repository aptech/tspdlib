new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

// With constant
model = 1;
{MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model);

// With constant and trend
model = 2;
{MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model);

