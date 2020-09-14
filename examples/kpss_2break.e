new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");
T = rows(y);

// bandwidth lag
bwl = round(4 * (T/100)^(2/9));
     
format /m1 /rd 8,4;
// Iterate through LR variance options

for i(1, 7, 1);
    varm = i;
   
    /*
    ** 1=Model A: break in level
    ** 2=Model C: break in level and trend
    */
    model = 1;
    { KPSS, tb1, tb2, cv } = KPSS_2breaks(y, model, bwl, varm);

    /*
    ** 1=Model A: break in level
    ** 2=Model C: break in level and trend
    */
    model = 2;
    { KPSS, tb1, tb2, cv } = KPSS_2breaks(y, model, bwl, varm);

endfor;

