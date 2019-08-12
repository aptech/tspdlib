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
model = 0;
print "Model with constant";

{ ADFe, pval, lags, Pe, nf } = BNG_PANIC(y, pmax, kmax, model, ic);

"PANIC     Stat.   p-value";
"Pe     ";;
Pe       ;;
1-cdfn(Pe);

"";
"# Factors";
"ICp2";;
nf[2];
"";
"       CS        ADF        p-val        Lags "
seqa(1,1,N)~ADFe~pval~lags;

/*
** Model with constant and trend
*/
model = 1;
print "Model with constant and trend";

{ ADFe, pval, lags, Pe, nf } = BNG_PANIC(y, pmax, kmax, model, ic);

"PANIC     Stat.   p-value";
"Pe     ";;
Pe       ;;
1-cdfn(Pe);

"";
"# Factors";
"ICp2";;
nf[2];
"";
"       CS        ADF        p-val        Lags "
seqa(1, 1, N)~ADFe~pval~lags;
