new;
cls;
library tspdlib;

// Load the dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

// Time variable
T = rows(data);

// Long-run consistent variance estimation method
varm = 3;

// Bandwidth for kernel estimator
bwl = round(4 * (T/100)^(2/9));  

// Leads & Lags for DOLS estimation
q = int(4*(t/100)^(2/9));

format/m1/rd 8,3;

"-----------None-----------------------------------------";
model = 0;
   { CIols, CIdols, cv } = coint_shin(y, x, model, bwl, varm, q);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: co-integration   (Shin, 1994)";  
    "   CIols         ";;CIols ;; cv';
    "   CIdols        ";;CIdols;; cv';    
    "";
    
"-----------Constant-------------------------------------";
model = 1;
   { CIols, CIdols, cv } = coint_shin(y, x, model, bwl, varm, q);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: co-integration   (Shin, 1994)";  
    "   CIols         ";;CIols ;; cv';
    "   CIdols        ";;CIdols;; cv';    
    "";
    

"-----------Constant and Trend---------------------------";
model = 2;
   { CIols, CIdols, cv } = coint_shin(y, x, model, bwl, varm, q);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: co-integration   (Shin, 1994)";  
    "   CIols         ";;CIols ;; cv';
    "   CIdols        ";;CIdols;; cv';    
    "";
  
