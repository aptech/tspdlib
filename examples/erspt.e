new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");
T = rows(y);

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

