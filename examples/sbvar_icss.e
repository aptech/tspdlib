new;
library tspdlib;

// Load data
ret_sp500 = loadd(__FILE_DIR $+ "ret_sp500.gdat");

// Demean the returns
e = ret_sp500[. ,"SP500"]  - meanc(ret_sp500[. ,"SP500"]);

// Run ICSS test
{ cp, nbre } = sbvar_icss(ret_sp500[., "date"]~e);

