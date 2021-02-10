new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

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
