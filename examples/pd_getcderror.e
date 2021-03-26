new;
cls;
library tspdlib;

// Number of cross-sections
N = 9;      

// Load data
data = loadd(__FILE_DIR $+ "pdcause.dat");

// Call test
{ LMbp, LMadj ,CDlm, CDlmadj, CD } = pd_getCDError(data[., "Y"], data[. , "X"], N);
