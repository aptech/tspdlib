new;
cls;
library tspdlib;

//Number of observations
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

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

// Leads & Lags for DOLS estimation
q = int(4*(t/100)^(2/9));

format/m1/rd 8,3;

"-----------Regime shift---------------------------------";
model = 3;

// Two breaks
{ADF_min, TB1adf, TB2adf, Zt_min, TB1zt, TB2zt, Za_min, TB1za, TB2za, cvADFZt, cvZa } =
    coint_hatemiJ(y, x, model, bwl, ic, pmax, varm, trimm);
    "Two breaks   (Hatemi-J, 2008)";
    "   Test         Statistic   TB1    TB2     CV(1%, 5%, 10%)";
    "Ho: no co-integration";  
    "   ADF        ";;ADF_min;;TB1adf;;TB2adf;;cvADFZt';
    "   Zt         ";;Zt_min;; TB1zt ;;TB2zt ;;cvADFZt';
    "   Za         ";;Za_min;; TB1za ;;TB2za ;;cvZa';
    "";
