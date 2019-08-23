new;
cls;
library tspdlib;

// Date dimensions
N    = 24;
T    = 112;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

// CADF and Modidied CADF tests

// Set up model
// 1=constant, 2= linear trend
model= 1;

// Max lags for ADF regression
pmax = 4;

// Information Criterion:
// 1=Akaike
// 2=Schwarz
// 3=t-stat significance
ic   = 3;

{ Ncadf, Nlm, Nmcadf, Nlags, pcadf, pmcadf } = cips(y, model, pmax, ic);

"Test            Stat.   p-value";
"CIPS         ";;
pcadf;;
"    NA  ";
"Modified CIPS";;
pmcadf;;
cdfn(pmcadf);
"";
"    id      CADF     LM       M-CADF   pval    Lags ";
if model == 1;
    q = 2;
endif;

if model == 2;
    q = 3;
endif;

seqa(1, 1, N)~Ncadf~Nlm~Nmcadf~cdfchic(abs(Nmcadf), q)~Nlags;

"M-CADF critical values";
"cv (0.01)";;
cdfchii(0.99, q);
"cv (0.05)";;
cdfchii(0.95, q);
"cv (0.10)";;
cdfchii(0.90, q);
