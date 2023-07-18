new;
library tspdlib;

// Load S&P data
FRED_API_KEY = "7a756a099f64c52f4657b4accc942137";
x = packr(fred_load("SP500"));

// Compute returns
ret_sp500 = (x[2:rows(x), "SP500"] - x[1:rows(x)-1, "SP500"])./x[1:rows(x)-1, "SP500"];

// Demean the returns
e = ret_sp500 - meanc(ret_sp500);

// Run ICSS test
{ cp, nbre } = sbvar_icss(x[2:rows(x), "date"]~e);

