/*
**
**  When you use this code, please cite to:
**  Kar, M., Nazlioglu, S., Agir, H. (2011) 
**  Financial Development and Economic Growth Nexus in the MENA Countries: 
**  Bootstrap Panel Granger Causality Analysis. 
**  Economic Modelling 28(1-2): 685-693.
**
**  Menyah, K., Nazlioglu, S., Wolde-Rufael, Y. (2014) 
**  Financial Development, Trade Openness and Economic Growth in African Countries: 
**  New Insights from a Panel Causality Approach". 
**  Economic Modelling 37: 386-394.
**
*/


new;
cls;
library tspdlib;

//// Load data
//data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pdcause.dat");

//// Number of cross-sections
//N = 9;  

// Load data
data = loadd(__FILE_DIR $+ "pd_brics.gdat");

// This panel has 5 countries
N = 5;

/*
** Run Fisher test
*/
test = "fisher";

// Call test
cause_stat = pd_cause(data[., 4:5], N, test);
end;

/*
** Run Zh and Zn test
*/
test = "zhnc";

// Call test
cause_stat = pd_cause(data[., 4:5], N, test);

/*
** Run SURwald test
*/
test = "surwald";

// Call test
cause_stat = pd_cause(data[., 4:5], N, test);
