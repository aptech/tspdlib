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

// Number of bootstrap replications
Nboot= 1000;    

// Number of time periods
T    = 28;      

// Number of cross-sections
N    = 9;      

// Maximum number of lags
pmax = 3;       

// Number of integration 
dmax = 1;       

// Information criterion; 
// 1 = Akaike, 2 = Schwarz
ic   = 2; 	

data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"pdcause.dat");

// Variable names
vnames = "y"$|"x";

Fisher = Panel_Fisher(data, vnames, pmax, dmax, ic, Nboot, N);

{ Znt, Zn } = Panel_Zhnc(data, vnames, pmax, ic, Nboot, N);

SURwald = Panel_SURwald(data, vnames, pmax, ic, Nboot, N);
