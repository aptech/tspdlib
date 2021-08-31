new;
cls;
library tspdlib;

// Load data matrix
GCdata = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"TScaus.dat");
data   = ln(GCdata);

// Toda & Yamamoto test
test = 1;

// Run test
GC_out = granger(data, test);
