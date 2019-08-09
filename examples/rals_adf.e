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

format /m1 /rd 8,4;

/*
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

"RALS-ADF ";
{ tauRALS, p2, cv } = RALSADF(y, model, pmax, ic);
"       RALS-ADF stat       ";;
tauRALS;
"       p2                  ";;
p2;
"       CV (1%, 5%, 10%)    ";;
cv;
"";

/*
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

"RALS-ADF ";
{ tauRALS, p2, cv } = RALSADF(y, model, pmax, ic);
"       RALS-ADF stat       ";;
tauRALS;
"       p2                  ";;
p2;
"       CV (1%, 5%, 10%)    ";;
cv;
"";
