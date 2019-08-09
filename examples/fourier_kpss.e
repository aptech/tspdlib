new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Maximum number of lags for ds;
** 0=no lags
*/
pmax = 12;

/*
** Information Criterion:
** 1=Akaike;
** 2=Schwarz;
** 3=t-stat sign.
*/
ic = 3;

// Maximum number of Fourier
fmax = 3;

format /m1 /rd 8,4;

// Loop through long-run variance options
for i(1, 7, 1);
    
    // Set long run variance method
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
    
    /*
    ** 0 = No deterministic component
    ** 1 = With constant
    ** 2 = With constant and trend
    */
    model = 1;
    
    if model == 1;
        "--------Model A: Break in level        -----";
    endif;
    if model == 2;
        "--------Model C: Break in level & trend-----";
    endif;
    
    "Fourier KPSS test (Becker, Enders & Lee, 2006)";
    k = Fourier(y, model, fmax);
    { KPSS, cv } = Fourier_KPSS(y, model, k, varm);
    "       KPSS-stat       ";;
    KPSS;
    "       Fourier         ";;
    k;
    "       CV (1%, 5%, 10%)";;
    cv;
    "";
    
    /*
    ** 0 = No deterministic component
    ** 1 = With constant
    ** 2 = With constant and trend
    */
    model = 2;
    
    if model == 1;
        "--------Model A: Break in level        -----";
    endif;
    if model == 2;
        "--------Model C: Break in level & trend-----";
    endif;
    
    "Fourier KPSS test (Becker, Enders & Lee, 2006)";
    k = Fourier(y, model, fmax);
    { KPSS, cv } = Fourier_KPSS(y, model, k, varm);
    "       KPSS-stat       ";;
    KPSS;
    "       Fourier         ";;
    k;
    "       CV (1%, 5%, 10%)";;
    cv;
    "";
    
endfor;

