new;
cls;
library tspdlib;

// Date dimensions
N = 24;
T = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

/*
** Set maximum number of lags for ds
** 0 = no lags
*/
pmax = 5;

/*
** Information Criterion:
** 1=Akaike;
** 2=Schwarz;
** 3=t-stat sign.
*/
ic = 3;

// Trimming rate
trimm = 0.10;

// n=Number of single frequency
k = 1;

// Iterate through LR variance options
for i(1, 7, 1);
    varm = i;
    
    // Panel stationarity test with level shifts
    model = 1;
    { Nkpss, FZk, pval } = PDfzk(y, model, k, varm);
   
    // Panel stationarity test with level shifts
    model = 2;
    { Nkpss, FZk, pval } = PDfzk(y, model, k, varm);

endfor;

