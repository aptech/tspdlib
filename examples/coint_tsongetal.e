new;
cls;
library tspdlib_dv;

// Load dataset
data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv", 
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

T = rows(data);

/*
** Using the defaults 
** bandwidth,
** LR variance computation method,
** DOLS leads and lags,
** and maximum Fourier frequency.
*/

model = 1;
{ CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
                    coint_tsongetal(y, x, model);
                   
model = 2; 
{ CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
                    coint_tsongetal(y, x, model);
 
