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

    /*
    ** 0 = No deterministic component
    ** 1 = With constant
    ** 2 = With constant and trend
    */
    model = 1;
    { KPSS, k, cv } = Fourier_KPSS(y, model, fmax, bwl, varm);
  
    /*
    ** 0 = No deterministic component
    ** 1 = With constant
    ** 2 = With constant and trend
    */
    model = 2;
 { KPSS, k, cv } = Fourier_KPSS(y, model, fmax, bwl, varm);

    
endfor;

