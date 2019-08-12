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

{ Ze, Ze_ba } = JWL_PANICadj(y, kmax, pmax, model, ic);

"PANIC     Stat.   p-value";
"Ze     ";;
Ze       ;;
cdfn(Ze);
"Ze+    ";;
Ze_ba    ;;
cdfn(Ze_ba);

/*
** Model with constant and trend
*/
model = 1;
print "Model with constant and trend";

{ Ze, Ze_ba } = JWL_PANICadj(y, kmax, pmax, model, ic);

"PANIC     Stat.   p-value";
"Ze     ";;
Ze       ;;
cdfn(Ze);
"Ze+    ";;
Ze_ba    ;;
cdfn(Ze_ba);
