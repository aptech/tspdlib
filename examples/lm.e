new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Maximum number of lags for ds; 
** 0=no lags
*/
pmax = 12;                 

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic = 3;                 

format /m1 /rd 8,4;

{ lm_tau, lm_p, lm_cv }  = lm(y, pmax, ic);

"LM unit root test";; lm_tau ;; lm_cv ;; lm_p ; 

