new;
cls;
library tspdlib;

data = loadd(__FILE_DIR $+ "coint_data.gdat");

dates = data[.,1];
x1 = data[.,2];
x2 = data[.,3];
x3 = data[.,4];

// Endogenous variables matrix
x = x1 ~ x2 ~ x3;
x = x1 ~ x2 ~ x3;

// Model dimensions
T = rows(x);
m = cols(x);


// Model
// 1 = Constant model
// 2 = Trend model
// 3 = Restricted Constant model
// 4 = Restricted Trend model
model = 3;

// Number of lags for VAR model
k = 2;

// Number of Fouier frequecncy
f = 1;

// Single or Cumulative frequency
// 1 = Single frequency
// 2 = Cumulative frequency
option = 1;

// Call procedure
{ Flambda, Ftrace, cv_Flambda, cv_Ftrace, logL } = Johansen_Fourier(x, model, k, f, option);
