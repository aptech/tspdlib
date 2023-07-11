new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", ". + date($Date, '%b-%y')");

// Panel stationarity test with level shifts
model = 1;
{ Nkpss, Npval, W, W_pval, P, P_pval, Pm, Pm_pval, Z, Z_pval } = pst_ca(y, model);

// Panel stationarity test with level shifts
model = 2;
{ Nkpss, Npval, W, W_pval, P, P_pval, Pm, Pm_pval, Z, Z_pval } = pst_ca(y, model);

