new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y + date($Date, '%b-%y')");

/*
**model
*/
model=2;

/*
**Number of breaks
*/
nbreaks = 2 ;

{ LM_min, tb, p, cv_lm, RALS_lm, p2, cv_ralslm } = RALSLM_breaks(y, model, nbreaks);
