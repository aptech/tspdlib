new;
cls;
library tspdlib_dv;

// Load dataset
data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv", 
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");

// Define y and x matrix
y = data[.,1];
x = data[.,2:cols(data)];

/*
** Traditional cointegration tests
*/
/*
** No deterministic component
*/
model = 0;
{ tau, cvADF } = coint_egranger(y, x, model);
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model);
{ CIols, CIdols, cv } = coint_shin(y, x, model);

/*
** Constant only
*/
model = 1;
{ tau, cvADF } = coint_egranger(y, x, model);
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model);
{ CIols, CIdols, cv } = coint_shin(y, x, model);

/*
** Constant and trend 
*/
model = 2;
{ tau, cvADF } = coint_egranger(y, x, model);
{ Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model);
{ CIols, CIdols, cv } = coint_shin(y, x, model);

/*
** Second generation tests
*/
/*
** Level shift
*/
model = 1;
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model);

{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model);

{ CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
    coint_tsongetal(y, x, model);


/*
** Level shift with trend
*/

model = 2;

{ ADF_min, TBadf, Zt_min, TBzt, Za_min, Bza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model);

{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model);

{ CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
    coint_tsongetal(y, x, model);


/*
** Regime shift
*/

model=3;

// One break
{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model);
    
{ ADF_min, TBadf, Zt_min, TBzt, Za_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model);

// Two breaks
{ ADF_min, TB1adf, TB2adf, Zt_min, TB1zt, TB2zt, Za_min, TB1za, TB2za, cvADFZt, cvZa } =
    coint_hatemiJ(y, x, model);

/*
** Regime and trend shift
*/

model = 4;
{ ADF_min, TBadf, Zt_min, TBzt, PPa_min, TBza, cvADFZt, cvZa } =
    coint_ghansen(y, x, model);

{ SCols, TBols, SCdols, TBdols, lambda, cv } =
    coint_cissanso(y, x, model);

