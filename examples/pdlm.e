/*
** This file will run six different tests:
**  1. Panel Data LM test with level shifts and 0 breaks
**  2. Panel data LM tests with level shifts and 1 break.
**  3. Panel data LM test with level shifts and 2 breaks.
**  4. Panel data LM test with level and trend shifts with 0 breaks.
**  5  Panel data LM test with level and trend shifts with 1 break.
**  6. Panel data LM test with level and trend shifts with 2 breaks. 
**
*/

new;
cls;
library tspdlib_dv;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", ". + date($Date, '%b-%y')");

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
