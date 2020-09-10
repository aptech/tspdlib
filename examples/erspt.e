new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");
T = rows(y);

// bandwidth lag
bwl = round(4 * (T/100)^(2/9));

format /m1 /rd 8,4;

for i(1, 7, 1);
    varm = i;
  
    /*
    ** With constant
    */
    model = 1;
    {  Pt, lrv, cvPt } = ERSpt(y, model, bwl, varm);

    /*
    ** With constant and trend
    */
    model = 2;
    { Pt, lrv, cvPt } = ERSpt(y, model, bwl, varm);

endfor;
