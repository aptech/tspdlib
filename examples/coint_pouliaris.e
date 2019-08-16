new;
cls;
library tspdlib;

//Number of observations
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[.,1];
x = data[.,2:cols(data)];

// Time variable
T = rows(data);

// Long-run consistent variance estimation method
varm = 3;

// Bandwidth for kernel estimator
bwl = round(4 * (T/100)^(2/9));  

format/m1/rd 8,3;

"-----------None-----------------------------------------";
model = 0;

    { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration (EG, 1987 & P0, 1990)";  
    "   PO_Zt         ";;Zt    ;; cvZt';
    "   PO_Za         ";;Za    ;; cvZa';
    "";
    
"-----------Constant-------------------------------------";
model = 1;
  
    { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration (EG, 1987 & P0, 1990)";  
    "   PO_Zt         ";;Zt    ;; cvZt';
    "   PO_Za         ";;Za    ;; cvZa';
    "";
    
"-----------Constant and Trend---------------------------";
model = 2;
  
    { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration (EG, 1987 & P0, 1990)";  
    "   PO_Zt         ";;Zt    ;; cvZt';
    "   PO_Za         ";;Za    ;; cvZa';
    "";
    
