new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_examples.csv", "Y + date($Date, '%b-%y')");

// Break in level  
model = 1;                  
{ ADF_min, tb1, tb2, p, cv } = ADF_2breaks(y, model);
    
// Break in level and trend
model = 2;                  
{ ADF_min, tb1, tb2, p, cv } = ADF_2breaks(y, model);

