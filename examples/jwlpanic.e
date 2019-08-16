new;
cls;
library tspdlib;

// Date dimensions
N = 24;
T = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

// Panic tests
"PANIC tests";

/*
** Set maximum number of lags for ds
** 0 = no lags
*/
pmax = 5;

// Max no of factors for PCA
kmax = 4;

// Information Criterion for optimal number of factors
ic = 2;

/*
** Model with constant
*/
model = 1;
print "Model with constant";

{ Pa_ca, Pb_ca, PMSB_ca } = JWR_PANICCA(y, model);

"PANICCA   Stat.   p-value";
"Pa     ";;
Pa_ca;;
cdfn(Pa_ca);
"Pb     ";;
Pb_ca;;
cdfn(Pb_ca);
"PMSB   ";;
PMSB_ca;;
cdfn(PMSB_ca);

/*
** Model with constant and trend
*/
model = 2;
print "Model with constant and trend";

{ Pa_ca, Pb_ca, PMSB_ca } = JWR_PANICCA(y, model);

"PANICCA   Stat.   p-value";
"Pa     ";;
Pa_ca;;
cdfn(Pa_ca);
"Pb     ";;
Pb_ca;;
cdfn(Pb_ca);
"PMSB   ";;
PMSB_ca;;
cdfn(PMSB_ca);
