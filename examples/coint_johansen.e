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

// Model
// 1 = None
// 2 = Restricted constant (RC) model
// 3 = Unrestricted constant model
// 4 = Restricted Trend model
// 5 = Unrestricted Trend model
model = 2;

// Number of lags for VAR model
k = 2;

// Call procedure
{ JHlambda, JHtrace, cv_Trace, logL, eigen_value } = coint_Johansen(x, model, k);
