new;
cls;
library tspdlib;

//Number of observations
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[.,1];
x = data[.,2:cols(data)];

T = rows(data);

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic = 2; 

//Maximum number of lags 
pmax = 12;  

// Trimming rate
trimm= 0.10;             

// Long-run consistent variance estimation method
varm = 3;

// Bandwidth for kernel estimator
bwl = round(4 * (T/100)^(2/9));  

format/m1/rd 8,3;

"-----------Level shift----------------------------------";
model = 1;

{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa}=
    coint_ghansen(y, x, model, bwl, ic, pmax, varm, trimm);
    "    Test         Statistic   TB     CV(1%, 5%, 10%)";
    "Ho: no co-integration   (GH, 1996)";  
    "   ADF        ";;ADF_min;;TBadf;;cvADFZt';
    "   Zt         ";;Zt_min;; TBzt;;cvADFZt';
    "   Za         ";;Za_min;; TBza;;cvZa';
   
"-----------Level shift with trend-----------------------";
model = 2; 

{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa}=
    coint_ghansen(y, x, model, bwl, ic, pmax, varm, trimm);
    "    Test         Statistic   TB     CV(1%, 5%, 10%)";
    "Ho: no co-integration   (GH, 1996)";  
    "   ADF        ";;ADF_min;;TBadf;;cvADFZt';
    "   Zt         ";;Zt_min;; TBzt;;cvADFZt';
    "   Za         ";;Za_min;; TBza;;cvZa';
 
"-----------Regime shift---------------------------------";
model = 3;

{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa}=
    coint_ghansen(y, x, model, bwl, ic, pmax, varm, trimm);
    "    Test         Statistic   TB     CV(1%, 5%, 10%)";
    "Ho: no co-integration   (GH, 1996)";  
    "   ADF        ";;ADF_min;;TBadf;;cvADFZt';
    "   Zt         ";;Zt_min;; TBzt;;cvADFZt';
    "   Za         ";;Za_min;; TBza;;cvZa';
 
"-----------Regime and trend shift-----------------------";
model = 4; 

{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa}=
    coint_ghansen(y, x, model, bwl, ic, pmax, varm, trimm);
    "    Test         Statistic   TB     CV(1%, 5%, 10%)";
    "Ho: no co-integration   (GH, 1996)";  
    "   ADF        ";;ADF_min;;TBadf;;cvADFZt';
    "   Zt         ";;Zt_min;; TBzt;;cvADFZt';
    "   Za         ";;Za_min;; TBza;;cvZa';
