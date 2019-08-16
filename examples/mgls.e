new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");
T = rows(y);

// bandwidth lag
bwl = round(4 * (T/100)^(2/9));
bwl = 1;   

format /m1 /rd 8,4;

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
    
    /*
    ** With constant
    */
    model = 1;
    
    if model == 0;
        "---------No deterministic component---------";
    elseif model == 1;
        "----------------With constant---------------";
    elseif model == 2;
        "------------With constant and trend---------";
    endif;
    
    {MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model, bwl, varm);
    
    "Test      Stat.   cv(1%)   cv(5%)   cv(10%)   Lag  ";
    "--------------------------------------------------";
    "MZa   " ;; MZa    ;; cvMZA;
    "MZt   " ;; MZt    ;; cvMZt;
    "MSB   " ;; MSB    ;; cvMSB;
    "MPT   " ;; MPT    ;; cvMPT;
    
    /*
    ** With constant and trend
    */
    model = 2;
    
    if model == 0;
        "---------No deterministic component---------";
    elseif model == 1;
        "----------------With constant---------------";
    elseif model == 2;
        "------------With constant and trend---------";
    endif;
    
    {MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model, bwl, varm);
    
    "Test      Stat.   cv(1%)   cv(5%)   cv(10%)   Lag  ";
    "--------------------------------------------------";
    "MZa   " ;; MZa    ;; cvMZA;
    "MZt   " ;; MZt    ;; cvMZt;
    "MSB   " ;; MSB    ;; cvMSB;
    "MPT   " ;; MPT    ;; cvMPT;
    
endfor;
