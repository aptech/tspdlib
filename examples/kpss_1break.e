new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

// Long-run consistent variance estimation method
varm = 3;

format /m1 /rd 8,4;

/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 1;                  

if model == 1; "--------Model A: Break in level        -----"; endif;
if model == 2; "--------Model C: Break in level & trend-----"; endif;
    
"One break KPSS test (Kurozumi, 2002)";
    { KPSS, tb1, lambda, cv } = KPSS_1break(y, model, varm);
    "       KPSS test       ";;KPSS;
    "       Break date      ";;tb1;
    "       Fraction        ";;lambda;
    "       CV (10%, 5%, 1%)";;cv;
"";
    
/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 2;                  

if model == 1; "--------Model A: Break in level        -----"; endif;
if model == 2; "--------Model C: Break in level & trend-----"; endif;
    
"One break KPSS test (Kurozumi, 2002)";
    { KPSS, tb1, lambda, cv } = KPSS_1break(y, model, varm);
    "       KPSS test       ";;KPSS;
    "       Break date      ";;tb1;
    "       Fraction        ";;lambda;
    "       CV (10%, 5%, 1%)";;cv;
"";
    
