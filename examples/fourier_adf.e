new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");

/*
** Use defaults for
** maximum number of lags for ds,
** information criterion,
** and maximum number of Fourier
*/

// With constant
model = 1;
{ ADFstat, f, p, cv } = Fourier_ADF(y, model);


// With constant and trend
model = 2;
{ ADFstat, f, p, cv } = Fourier_ADF(y, model);

// Find F-stat
{ f_stat, p_val } = fourierADFFTest(y[., "Y"], model, f, p);

proc (2) = fourierADFFTest(y, model, k, p);
    local t, dy, ly, dc, dt, sink, cosk,
        dep, y1, ldy, sbt, trnd, sinp, cosp, z1, z2,
        b1, e1, sig21, se1, ssr1, b2, e2, sig22, se2, ssr2,
        k1, k2, lmat, j;
    
    // Check number of columns of y
    if cols(y) > 1;
        errorlogat "Cannot run test, y must be single column.";
        end;
    endif;
    
    t = rows(y);
    
    dy = diff(y, 1);
    ly = lagn(y, 1);
    
    // Deterministic term=constant
    dc = ones(t, 1);
    
    // Deterministic term=trend
    dt = seqa(1, 1, t);
    sink = sin(2 * pi * k * seqa(1, 1, t)/t);
    cosk = cos(2 * pi * k * seqa(1, 1, t)/t);
    
    // Find lmat
    lmat = zeros(rows(dy), p + 1);
    j = 1;
    do while j <= p;
        local tmp;
        tmp = lagn(dy, j);
        lmat[., j] = lagn(dy, j);
        j = j + 1;
    endo;
    
    // Prepare data
    dep = trimr(dy, p + 1, 0);
    y1 = trimr(ly, p + 1, 0);
    ldy = trimr(lmat, p + 1, 0);
    sbt = trimr(dc, p + 1, 0);
    trnd = trimr(dt, p + 1, 0);
    sinp = trimr(sink, p + 1, 0);
    cosp = trimr(cosk, p + 1, 0);
    
    if p == 0;
        if model == 1;
            z1 = y1~sbt;
        endif;
        
        if model == 2;
            z1 = y1~sbt~trnd;
        endif;
        
    elseif p > 0;
        if model == 1;
            z1 = y1~sbt~ldy[., 1:p];
        endif;
        if model == 2;
            z1 = y1~sbt~trnd~ldy[., 1:p];
        endif;
    endif;
    
    // Unrestricted model
    z2 = z1~sinp~cosp;
    
    // Estimate model one
    // Restricted model
    {b1, e1, sig21, se1, ssr1} = myols(dep, z1);
    
    // Unrestricted model
    {b2, e2, sig22, se2, ssr2} = myols(dep, z2);
    
    // Count dimension of models
    k1 = cols(z1);
    k2 = cols(z2);
    
    // Generate F_stat
    F_stat = ((ssr1 - ssr2)/(k2 - k1))/(ssr2/(t-k2));
    
    // Find p-value
    p_val = cdffc(F_stat, k2 - k1, t-k2);
    
     _printHeaderTSPDLIB(0, 0, 2, model, 4, 0, "Fourier ADF F-Stat", "No breaks", 0);

    // Print results & Critical values
    local top, side, stats, dec, colwidth;
    side = "ADF-stat:";
    top = "";
    stats = ADF;
    dec = 3;
    colwidth = 15;
            
    _printStatsTable(top, side, stats, crit[f, .]', dec, colwidth, 0, opt_lag-1, f);
    _printConclusion(ADF, crit[f, .], 0, "unit root");
    
    retp(F_stat, p_val);
endp;

