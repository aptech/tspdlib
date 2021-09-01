new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", "Y1 + Y2 + Y3 + Y4 + Y5 + Y6 + Y7 + Y8 + Y9 + Y10 + Y11 + Y12 + Y13 + Y14 + Y15 + Y16 + Y17 + Y18 + Y19 + Y20 + Y21 + Y22 + Y23 + Y24 + date($Date, '%b-%y')");

// Run panel LM test with level shifts
// No breaks
model = 1;

// No breaks
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, model);

// One breaks
nbreak = 1;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, model, nbreak);

// Two breaks
nbreak = 2;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, model, nbreak);

// Run panel LM test with level and trend shifts
// No breaks
model = 2;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, model);

// One breaks
nbreak = 1;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, model, nbreak);

// Two breaks
nbreak = 2;
{ Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, model, nbreak);
