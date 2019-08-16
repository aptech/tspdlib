new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Maximum number of lags for ds; 
** 0 = no lags
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

/*
** With constant
*/
model = 1;                  

{ GLStau, GLSp, cvGLS } = DFGLS(y, model, pmax, ic);

"ERS tests      ";
"Test      Stat.   cv(1%)   cv(5%)   cv(10%)   Lag  ";
"--------------------------------------------------";
"DFGLS " ;; GLStau ;; cvGLS ;; GLSP ;

/*
** With constant and trend
*/
model = 2;

{ GLStau, GLSp, cvGLS } = DFGLS(y, model, pmax, ic);

"ERS tests      ";
"Test      Stat.   cv(1%)   cv(5%)   cv(10%)   Lag  ";
"--------------------------------------------------";
"DFGLS " ;; GLStau ;; cvGLS ;; GLSP ;
