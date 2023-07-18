new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", ". + date($Date, '%b-%y')");

// Call PD LM without break
"Panel LM test without shifts";
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, 1);

// Run panel LM test with level shifts
"Panel LM test with level shifts";

// Run with one break
nbreak = 1;

// Call PD LM with level break
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, 1, nbreak);

// Run with two breaks
nbreak = 2;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, 1, nbreak);

// Run LM test with level and trend shifts
"Panel LM test with level and trend shifts";

// One break
nbreak = 1;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, 2, nbreak);


// Two breaks
nbreak=2;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, 2, nbreak);

// Panel stationarity test with level shifts
"Panel stationarity test with level shifts";
model = 1;
k = 4;
{ Nkpss, FZk, pval } = PDfzk(y, model, k);

// Panic tests with constant only
"PANIC tests";
model = 1;

{ ADFe, pval, lags, Pe, nf } = BNG_PANIC(y, model);
{ Pa_pc, Pb_pc, PMSB_pc }    = BNG_PANICnew(y, model);
{ Ze, Ze_ba }                = JWL_PANICadj(y, model);
{ Pa_ca, Pb_ca, PMSB_ca}     = JWR_PANICCA(y, model);

// CADF and Modidied CADF tests with constant
model = 1;       
{ Ncadf, Nlm, Nmcadf, Nlags, pcadf, pmcadf } = cips(y, model);

