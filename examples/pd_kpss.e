new;
cls;

library tspdlib_dv;

// Load data
data = loadd(__FILE_DIR $+ "pd_gdef.gdat");

// Print data headers
varnames = getColNames(data);

/*
** Calculation of the test with 1 change to the mean
*/

// Set kernel
kernel = 1;

// Set maxlags
maxlags = 5;

// Maximum humber of structural changes allowed
max_brks = 5;

// Model when there are no changes.
// Second model: individual effects + tendency
model0 = 2;

//  Model when there are changes.
// Changes in the mean and the slope
model = 4;

/*
** Settings for structural break estimation
*/
// Declare structural break control structure
struct sbControl bCtl;

// Set control structure members
// to default values
bCtl = sbControlCreate(rows(data));

// Set to print the output from the iterations
bCtl.printd = 1;

// Option for construction of F-tests
//  Set to 1 if want to allow for the variance of the residuals
//  to be different across segments. If hetvar=0, the variance
//  of the residuals is assumed constant across segments
//  and constructed from the full sample. This option is not available
//  when robust = 1.
bCtl.hetvar = 1;

// Set to 1 if want to estimate the model with
// the number of breaks selected by BIC.
bCtl.estimbic = 1;

// Set to 1 if want to estimate the model with
// the number of breaks selected using the
// sequential procedure.
bCtl.estimseq = 0;

/*****************************************************************************/
/*****************************************************************************/
{ test_hom, test_het, kpsstest, m_br} = pd_kpss(data[., 2:cols(data)], model, model0, kernel, maxlags, max_brks, bCtl);

plotPDKPSS(data[., 2:cols(data)], m_br, kpsstest, 1995, 1, varnames[2:rows(varnames)]);



