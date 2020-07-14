new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");
T = rows(y);

// bandwidth lag
bwl = round(4 * (T/100)^(2/9));

// Set model type
// 1 = Constant
// 2 = Constant and trend
model = 1;

// Set long-run variance computation type
// 1           iid.
// 2           Bartlett.
// 3           Quadratic Spectral (QS).
// 4           SPC with Bartlett /see (Sul, Phillips & Choi, 2005)
// 5           SPC with QS
// 6           Kurozumi with Bartlett
// 7           Kurozumi with QS
varm = 1;

{ kpss, cvKPSS } = lmkpss(y, model, bwl, varm);
