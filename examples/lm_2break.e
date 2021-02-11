new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y + date($Date, '%b-%y')");

// Break in level
model = 1;                 
{ LM_min, tb1, tb2, p, cv } = LM_2breaks(y, model);
   
// Break in level and trend
model = 2;                
{ LM_min, tb1, tb2, p, cv } = LM_2breaks(y, model);
