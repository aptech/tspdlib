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

"Fourier LM test (Enders & Lee, 2012)";
{ LMstat, f, p, cv } = Fourier_LM(y, pmax, fmax, ic);
"       LM-stat         ";;
LMstat;
"       Fourier         ";;
f;
"       Lag             ";;
p;
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

"Fourier LM test (Enders & Lee, 2012)";
{ LMstat, f, p, cv} = Fourier_LM(y, pmax, fmax, ic );
"       LM-stat         ";;
LMstat;
"       Fourier         ";;
f;
"       Lag             ";;
p;
"       CV (1%, 5%, 10%)";;
cv;
"";
