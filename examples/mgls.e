new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_examples.csv", "Y + date($Date, '%b-%y')");

// With constant
model = 1;
{MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model);

// With constant and trend
model = 2;
{MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model);

