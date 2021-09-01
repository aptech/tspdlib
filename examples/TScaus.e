
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
GCdata = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TScaus.dat");

for test(1, 5, 1);
    
    data   = ln(GCdata);
    vnames = "y1"$|"y2"$|"y3"$|"y4";
    
    if test == 0 or test == 4;
        if order == 0;
            data = data;
        endif;
        if order == 1;
            data = trimr(diff(data,1),1,0);
        endif;
        
    endif;
    
    GC_out = GC_tests(data, vnames, pmax, ic, test, Nboot);
    print;
    
endfor;
