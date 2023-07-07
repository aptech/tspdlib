new;
cls;

library tspdlib_dv;

// Load data
data = loadd(__FILE_DIR $+ "pd_gdef.gdat");
data = setColDateFormats(data, "%Y", "Year");

/*
** Calculation of the test with 1 change to the mean
*/

//  Model when there are changes.
// Changes in the mean and the slope
model = 4;

// Maximum humber of structural changes allowed
max_brks = 5;

// Set kernel
kernel = 6;

// Set bandwidth for varm
bwl = round(4 * (rows(data)/100)^(2/9));

// Set maxlags
maxlags = 5;

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
{ test_hom, test_het, kpsstest, m_br} = pd_kpss(data, model, max_brks, kernel, bwl, maxlags, bctl);

// Plot results
plotPDKPSS(data, m_br, kpsstest);



