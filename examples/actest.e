#include actest.src

/*
** This code is based on the original ACtest.prg file provide by
** Abdulnasser Hatemi-J
*/


/*
** The program tests the hypothesis that the
** second variable in your data file do not
** cause the first one. Change the order of the
** variables in the data file in oder to test
** other hypotheses of interest.
*/

// For printing
outwidth 200;

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

rndseed 30540;

// The maximum # of simulations
// for computing bootstrapped critical
// values. It should be a multiple of 20
bootmaxiter = 1000;

// Information criterion used:
// 1=AIC, 2=AICC, 3=SBC,
// 4=HQC, 5=HJC, 6=use maxlags
infocrit = 5;

// Maximum lag order in the VAR model
// (without additional lags for unit roots).
// The value can be changed.
maxlags = 4;

// This value allows for one addition
// unrestricted lag in the VAR model
// in order to account for the unit root.
intorder = 1;

// This sets whether to use the positive components 
// Set to 1 use positive components
// 0 to use negative components
pos = 1;

// Call for asymetric test
{ Wstat, WcriticalvalsS, ICOrder, Azdsys } = aymCasualitytest(YZlevel, ln_form, maxlags, infocrit, intorder, bootmaxiter, pos);
