new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");
T = rows(y);

// bandwidth lag
bwl = round(4 * (T/100)^(2/9));

for i(1, 7, 1);
    varm = i;
    
    /*
    ** With constant
    */
    model = 1;
    {MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model, bwl, varm);
  
    /*
    ** With constant and trend
    */
    model = 2;
    {MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model, bwl, varm);
  
endfor;
