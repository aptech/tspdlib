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
    
    print "LR Variance estimation method";
    if varm == 1;
        print "iid";
    endif;
    if varm == 2;
        print "Bartlett";
    endif;
    if varm == 3;
        print "Quadratic Spectral (QS)";
    endif;
    if varm == 4;
        print "SPC with Bartlett /see (Sul, Phillips & Choi, 2005)";
    endif;
    if varm == 5;
        print "SPC with QS";
    endif;
    if varm == 6;
        print "Kurozumi with Bartlett";
    endif;
    if varm == 7;
        print "Kurozumi with QS";
    endif;
    
    
    // Panel stationarity test with level shifts
    "Panel stationarity test with level shifts";
    model = 1;
    { Nkpss, FZk, pval } = PDfzk(y, model, k, varm);
    seqa(1, 1, cols(y))~Nkpss;
    FZk;
    pval;
    
    // Panel stationarity test with level shifts
    "Panel stationarity test with level and trend shifts";
    model = 2;
    { Nkpss, FZk, pval } = PDfzk(y, model, k, varm);
    seqa(1, 1, cols(y))~Nkpss;
    FZk;
    pval;
endfor;

