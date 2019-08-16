new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");
T = rows(y);

// bandwidth lag
bwl = round(4 * (T/100)^(2/9));
bwl = 1;

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
    { KPSS, k, cv } = Fourier_KPSS(y, model, fmax, bwl, varm);
    "       KPSS-stat       ";;KPSS;
    "       Fourier         ";;k;
    "       CV (10%, 5%, 1%)";;cv;
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
    { KPSS, k, cv } = Fourier_KPSS(y, model, fmax, bwl, varm);
    "       KPSS-stat       ";;KPSS;
    "       Fourier         ";;k;
    "       CV (10%, 5%, 1%)";;cv;
    "";
    
endfor;

