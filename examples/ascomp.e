/*
** ascomp.e
** This example uses the cumulativeComp proc
** based on original code found in the ascomp.prg file
** written by Abdulnasser Hatemi-J
*/ 	

/*
** For public, non-commercial use only.
** If this code is used for research or in other code, please include proper attribution.
** The author makes no guarantee about performance.
*/

// For printing
outwidth 200;

// Make sure screen in on
screen on;
#include actest.src

/*
** Load data
*/

// Indicate filename can be .csv, .xls, .xlsx,
// .dat, .dta, SAS7BDAT, SAS7BCAT, HDF5
fname = __FILE_DIR $+ "/nelsonplosser.dta";
formula = "m+bnd";

// Load data file 
YZlevel  = packr(loadd(fname, formula));	

// Specify whether to use log form
ln_form = 0;

{ YZ_pos, YZ_neg } = cumulativeComp(YZlevel, ln_form);
