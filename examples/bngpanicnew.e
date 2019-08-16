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

// Max no of factors for PCA
kmax = 4;

// Information Criterion for optimal number of factors
ic = 2;


/*
** Model with constant and trend
*/
model = 1;
print "Model with intercept";

{ Pa_pc, Pb_pc, PMSB_pc } = BNG_PANICnew(y, kmax, model, ic);

"PANIC     Stat.   p-value";
"Pa     ";;
Pa_pc    ;;
cdfn(Pa_pc);
"Pb     ";;
Pb_pc    ;;
cdfn(Pb_pc);
"PMSB   ";;
PMSB_pc  ;;
cdfn(PMSB_pc);

/*
** Model with constant and trend
*/
model = 2;
print "Model with intercept and trend";

{ Pa_pc, Pb_pc, PMSB_pc } = BNG_PANICnew(y, kmax, model, ic);

"PANIC     Stat.   p-value";
"Pa     ";;
Pa_pc    ;;
cdfn(Pa_pc);
"Pb     ";;
Pb_pc    ;;
cdfn(Pb_pc);
"PMSB   ";;
PMSB_pc  ;;
cdfn(PMSB_pc);
