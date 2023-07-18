new;
cls;
library tspdlib;

// Load date file
y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

// Use constant, no trend model
model = 1;

/*
** QKS test of Koenker & Xiao (2004)
*/
test = 1;
stat = qks_tests(y, model, test); 

/*
** Fourier QKS test of Li & Zheng (2018)
*/
test = 2;
stat = qks_tests(y, model, test); 

/*
** Nonlinear QKS test of Li & Park (2018)
*/
test = 3;
stat = qks_tests(y, model, test); 

/*
** Fourier Nonlinear QKS test of Bahmani-Oskooee et al. (2020)
*/
test = 4;
stat = qks_tests(y, model, test); 
