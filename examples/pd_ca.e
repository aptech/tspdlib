new;
cls;
library tspdlib_dev;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", "Y1 + Y2 + Y3 + Y4 + Y5 + Y6 + Y7 + Y8 + Y9 + Y10 + Y11 + Y12 + Y13 + Y14 + Y15 + Y16 + Y17 + Y18 + Y19 + Y20 + Y21 + Y22 + Y23 + Y24 + date($Date, '%b-%y')");

// Panel stationarity test with level shifts
model = 1;
{ Nkpss, Npval, W, W_pval, P, P_pval, Pm, Pm_pval, Z, Z_pval } = pst_ca(y, model);

// Panel stationarity test with level shifts
model = 2;
{ Nkpss, Npval, W, W_pval, P, P_pval, Pm, Pm_pval, Z, Z_pval } = pst_ca(y, model);

