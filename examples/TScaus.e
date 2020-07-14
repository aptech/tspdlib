
new;
cls;

library tspdlib;

// Number of bootstrap replications
Nboot= 1000;

// Number of observations
T  = 188;

// Number of lags in VAR model
pmax = 12;

// Information criterion
// 1 = Akaike; 
// 2 = Schwarz; 
ic   = 1; 

order= 0;  // 0 = VAR in levels for Granger causality test
           // 1 = VAR in first differences for Granger causality test
           
// Load data matrix
GCdata = loadd(__FILE_DIR $+ "TScaus.dat");

for test(1, 5, 1);

    data   = ln(GCdata);
    vnames = "y1"$|"y2"$|"y3"$|"y4";
    
    if test == 0;
            if order == 0; data = data; endif;
            if order == 1; data = trimr(diff(data,1),1,0); endif;        
            "       Standard Granger Causality Test                      ";
            "------------------------------------------------------------";    
    elseif test == 1;
            "      Toda & Yamamoto Granger Causality Test                ";
            "-------------------------------------------------------------";     
    elseif test == 2;
            if order == 0; data = data; endif;
            if order == 1; data = trimr(diff(data,1),1,0); endif;     
            "  Single Fourier-frequency Granger Causality Test            ";
            "-------------------------------------------------------------";     
    elseif test == 3;
            " Single Fourier-frequency Toda & Yamamoto Causality Test     ";
            "-------------------------------------------------------------";     
    elseif test == 4;
            if order == 0; data = data; endif;
            if order == 1; data = trimr(diff(data,1),1,0); endif;            
            "   Cumulative Fourier-frequency Granger Causality Test       ";
            "-------------------------------------------------------------";      
    elseif test == 5;
            " Cumulative Fourier-frequency Toda & Yamamoto Causality Test ";
            "-------------------------------------------------------------";      
    endif;
    
    format/m1/rd 8,5;
"Direction           Asym.   Bootstrap                   ";
"           Wald     p-val.   pval.     Lag     Frequency";    
    GC_out = GC_tests(data, vnames, pmax, ic, test, Nboot);
    " ";
    
endfor;
