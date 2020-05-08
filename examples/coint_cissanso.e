new;
cls;
library tspdlib;

// Load dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

T = rows(data);

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

format/m1/rd 8,3;

"-----------Level shift----------------------------------";
model = 1;
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model, bwl, varm, trimm, q);
    "Ho: co-integration  (CiS & Sanso, 2006; AK, 2007)";
    "   SCols      ";;SCols ;; TBols ;; cv';
    "   SC*(dols)  ";;SCdols;; TBdols;; cv';
    "   Fraction   ";; lambda;
    ""; 
"-----------Level shift with trend-----------------------";
model = 2; 
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model, bwl, varm, trimm, q);
    "Ho: co-integration  (CiS & Sanso, 2006; AK, 2007)";
    "   SCols      ";;SCols ;; TBols ;; cv';
    "   SC*(dols)  ";;SCdols;; TBdols;; cv';
    "   Fraction   ";; lambda;
    "";

"-----------Regime shift---------------------------------";
model = 3;
    
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model, bwl, varm, trimm, q);
    "Ho: co-integration  (CiS & Sanso, 2006; AK, 2007)";
    "   SCols      ";;SCols ;; TBols ;; cv';
    "   SC*(dols)  ";;SCdols;; TBdols;; cv';
    "   Fraction   ";; lambda;
    "";
"-----------Regime and trend shift-----------------------";
model = 4; 

{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model, bwl, varm, trimm, q);
    "Ho: co-integration  (CiS & Sanso, 2006; AK, 2007)";
    "   SCols      ";;SCols ;; TBols ;; cv';
    "   SC*(dols)  ";;SCdols;; TBdols;; cv';
    "   Fraction   ";; lambda;
    "";
