new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_examples.csv", "Y");

/*
** Use defaults
** bandwidth and
** LF variance type.
*/

/*
** With constant
*/
model = 1;
{  Pt, lrv, cvPt } = ERSpt(y, model);

/*
** With constant and trend
*/
model = 2;
{ Pt, lrv, cvPt } = ERSpt(y, model);

