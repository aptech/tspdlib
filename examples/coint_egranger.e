new;
cls;
library tspdlib;

// Load the dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic = 2; 

//Maximum number of lags 
pmax = 12;  

format/m1/rd 8,3;

"-----------None-----------------------------------------";
model = 0;
    { tau, cvADF } = coint_egranger(y, x, model, pmax, ic);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration (EG, 1987 & P0, 1990)";  
    "   EG_ADF        ";;tau   ;; cvADF';
    "";
    
"-----------Constant-------------------------------------";
model = 1;
    { tau, cvADF } = coint_egranger(y, x, model, pmax, ic);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration (EG, 1987 & P0, 1990)";  
    "   EG_ADF        ";;tau   ;; cvADF';
    "";

"-----------Constant and Trend---------------------------";
model = 2;
    { tau, cvADF } = coint_egranger(y, x, model, pmax, ic);

    "    Test         Statistic  CV(1%, 5%, 10%)";
    "Ho: no co-integration (EG, 1987 & P0, 1990)";  
    "   EG_ADF        ";;tau   ;; cvADF';
    "";
