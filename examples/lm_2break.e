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

// Trimming rate
trimm = 0.10;             

format /m1 /rd 8,4;

/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 1;                  

if model == 1; "--------Model A: Break in level        -----"; endif;
if model == 2; "--------Model C: Break in level & trend-----"; endif;
    
"Two breaks LM test (Lee & Strazicich, 2003)";
    { LM_min, tb1, tb2, p, cv } = LM_2breaks(y, model, pmax, ic, trimm);
    "       LM-stat         ";;LM_min;
    "       Break dates     ";;tb1~tb2;
    "       Fraction        ";;tb1/rows(y)~tb2/rows(y);
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv;
    "";
    
/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 2;                  

if model == 1; "--------Model A: Break in level        -----"; endif;
if model == 2; "--------Model C: Break in level & trend-----"; endif;
    
"Two breaks LM test (Lee & Strazicich, 2003)";
    { LM_min, tb1, tb2, p, cv } = LM_2breaks(y, model, pmax, ic, trimm);
    "       LM-stat         ";;LM_min;
    "       Break dates     ";;tb1~tb2;
    "       Fraction        ";;tb1/rows(y)~tb2/rows(y);
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv;
    "";
    
