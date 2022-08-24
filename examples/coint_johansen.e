new;
cls;
library tspdlib_dv;

data = xlsReadM("example_data.xlsx","a2");

dates = data[.,1];
x1 = data[.,2];
x2 = data[.,3];
x3 = data[.,4];

// Endogenous variables matrix
x = x1 ~ x2 ~ x3;

// Model
// 1 = None
// 2 = Resctricted constant (RC) model
// 3 = Unrestricted constant model
// 4 = Restricted Trend model
// 5 = Unrestricted Trend model
model = 2;
// Number of lags for VAR model
k = 2;

// Call procedure
{JHlambda, JHtrace, cv_Trace, logL, eigen_value} = Johansen(x, model, k);
