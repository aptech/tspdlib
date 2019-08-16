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
trimm = 0.10;             

// Long-run consistent variance estimation method
varm = 3;

// Bandwidth for kernel estimator
bwl = round(4 * (T/100)^(2/9));  

// Leads & Lags for DOLS estimation
q = int(4*(t/100)^(2/9));

// Maximum number of Fourier frequency
kmax = 3;

format/m1/rd 8,3;

"-----------None-----------------------------------------";
model = 0;
    { tau, cvADF } = coint_egranger(y, x, model, pmax, ic);
    { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);
    { CIols, CIdols, cv } = coint_shin(y, x, model, varm, q);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration (EG, 1987 & P0, 1990)";  
    "   EG_ADF        ";;tau   ;; cvADF';
    "   PO_Zt         ";;Zt    ;; cvZt';
    "   PO_Za         ";;Za    ;; cvZa';
    "Ho: co-integration   (Shin, 1994)";  
    "   CIols         ";;CIols ;; cv';
    "   CIdols        ";;CIdols;; cv';    
    "";
    
"-----------Constant-------------------------------------";
model = 1;
    { tau, cvADF } = coint_egranger(y, x, model, pmax, ic);
    { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);
    { CIols, CIdols, cv } = coint_shin(y, x, model, varm, q);

    "   Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration (EG, 1987 & P0, 1990)";  
    "   EG_ADF        ";; tau   ;; cvADF';
    "   PO_Zt         ";; Zt    ;; cvZt';
    "   PO_Za         ";; Za    ;; cvZa';
    "Ho: co-integration   (Shin, 1994)";  
    "  CIols         ";; CIols ;;  cv';
    "  CIdols        ";; CIdols;;  cv';
    "";

"-----------Constant and Trend---------------------------";
model = 2;
    { tau, cvADF } = coint_egranger(y, x, model, pmax, ic);
    { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);
    { CIols, CIdols, cv } = coint_shin(y, x, model, varm, q);

    "   Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration   (EG, 1987 & P0, 1990)";  
    "   EG_ADF        ";; tau   ;; cvADF';
    "   PO_Zt         ";; Zt    ;; cvZt';
    "   PO_Za         ";; Za    ;; cvZa';
    "Ho: co-integration   (Shin, 1994)";  
    "   CIols         ";; CIols ;;  cv';
    "   CIdols        ";; CIdols;;  cv';
    "";
    
"-----------Level shift----------------------------------";
model = 1;
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model, ic, pmax, varm, trimm);
    "   Test        Statistic   TB     CV(1%, 5%, 10%)";
    "Ho: no co-integration   (GH, 1996)";  
    "   ADF        ";;ADF_min;;TBadf;;cvADFZt';
    "   Zt         ";;Zt_min;; TBzt;;cvADFZt';
    "   Za         ";;Za_min;; TBza;;cvZa';


{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model, varm, trimm, q);
    "Ho: co-integration   (CiS & Sanso, 2006; AK, 2007)";
    "   SCols      ";;SCols ;; TBols ;; cv';
    "   SC*(dols)  ";;SCdols;; TBdols;; cv';
    "   Fraction   ";; lambda;
    "";

{ CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
                    coint_tsongetal(y, x, model, kmax, varm, q);
    "Ho: co-integration   (Tsong et al., 2016)";                    
    "   Fourier CIols ";; CIfols;;  cv_fourier';
    "   Freq. (Fols)  ";; FFols;
    "   F-stat (Fols) ";; Fols[FFols];
    "   Fourier CIdols";; CIfdols;;cv_fourier';
    "   Freq. (Fdols) ";; FFdols;  
    "   F-stat(Fdols) ";; Fdols[FFdols]; 
    "";    
                    
"-----------Level shift with trend-----------------------";
model = 2; 
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, Bza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model, ic, pmax, varm, trimm);
    "   Test         Statistic   TB     CV(1%, 5%, 10%)";
    "Ho: no co-integration    (GH, 1996)";  
    "   ADF        ";;ADF_min;;TBadf;;cvADFZt';
    "   Zt         ";;Zt_min;; TBzt;;cvADFZt';
    "   Za         ";;Za_min;; TBza;;cvZa';

{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model, varm, trimm, q);
    "Ho: co-integration  (CiS & Sanso, 2006; AK, 2007)";
    "   SCols      ";;SCols ;; TBols ;; cv';
    "   SC*(dols)  ";;SCdols;; TBdols;; cv';
    "   Fraction   ";; lambda;
    "";

"-----------Trend shift----------------------------------";    
model = 2; 
{ CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
                    coint_tsongetal(y, x, model, kmax, varm, q);
    "Ho: co-integration   (Tsong et al., 2016)";                           
    "   Fourier CIols ";; CIfols;;  cv_fourier';
    "   Freq. (Fols)  ";; FFols;
    "   F-stat (Fols) ";; Fols[FFols];
    "   Fourier CIdols";; CIfdols;;cv_fourier';
    "   Freq. (Fdols) ";; FFdols;  
    "   F-stat(Fdols) ";; Fdols[FFdols]; 
    "";
    
"-----------Regime shift---------------------------------";
model=3;
// One break
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model, ic, pmax, varm, trimm);
    "    Test         Statistic   TB     CV(1%, 5%, 10%)";
    "Ho: no co-integration   (GH, 1996)";  
    "   ADF        ";;ADF_min;;TBadf;;cvADFZt';
    "   Zt         ";;Zt_min;; TBzt;;cvADFZt';
    "   Za         ";;Za_min;; TBza;;cvZa';
    
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model, varm, trimm, q);
    "Ho: co-integration  (CiS & Sanso, 2006; AK, 2007)";
    "   SCols      ";;SCols ;; TBols ;; cv';
    "   SC*(dols)  ";;SCdols;; TBdols;; cv';
    "   Fraction   ";; lambda;
    ""; 

// Two breaks
{ ADF_min, TB1adf, TB2adf, Zt_min, TB1zt, TB2zt, Za_min, TB1za, TB2za, cvADFZt, cvZa } =
    coint_hatemiJ(y, x, model, ic, pmax, varm, trimm);
    "Two breaks   (Hatemi-J, 2008)";
    "   Test         Statistic   TB1    TB2     CV(1%, 5%, 10%)";
    "Ho: no co-integration";  
    "   ADF        ";;ADF_min;;TB1adf;;TB2adf;;cvADFZt';
    "   Zt         ";;Zt_min;; TB1zt ;;TB2zt ;;cvADFZt';
    "   Za         ";;Za_min;; TB1za ;;TB2za ;;cvZa';
    "";

"-----------Regime and trend shift-----------------------";
model = 4; 
{ ADF_min, TBadf, Zt_min, TBzt, PPa_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model, ic, pmax, varm, trimm);
    "   Test         Statistic   TB     CV(1%, 5%, 10%)";
    "Ho: no co-integration   (GH, 1996)";  
    "   ADF        ";;ADF_min;;TBadf;;cvADFZt';
    "   Zt         ";;Zt_min;;TBzt;;cvADFZt';
    "   Za         ";;Za_min;;TBza;;cvZa';

{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model, varm, trimm, q);
    "Ho: co-integration  (CiS & Sanso, 2006; AK, 2007)";
    "   SCols      ";;SCols ;; TBols ;; cv';
    "   SC*(dols)  ";;SCdols;; TBdols;; cv';
    "   Fraction   ";; lambda;
    "";
