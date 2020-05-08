new;
cls;
library tspdlib;

// Load the dataset
data = loadd(__FILE_DIR $+ "TScoint.dat");

// Define y and x matrix
y = data[., 1];
x = data[., 2:cols(data)];

T = rows(data);

// Long-run consistent variance estimation method
varm = 3;

// Bandwidth for kernel estimator
bwl = round(4 * (T/100)^(2/9));  

// Leads & Lags for DOLS estimation
q = int(4*(t/100)^(2/9));

// Maximum number of Fourier frequency
kmax = 3;

format/m1/rd 8,3;

"-----------Level shift----------------------------------";
model = 1;
{ CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
                    coint_tsongetal(y, x, model, bwl, kmax, varm, q);
    "Ho: co-integration   (Tsong et al., 2016)";                    
    "   Fourier CIols ";; CIfols;;  cv_fourier';
    "   Freq. (Fols)  ";; FFols;
    "   F-stat (Fols) ";; Fols[FFols];
    "   Fourier CIdols";; CIfdols;;cv_fourier';
    "   Freq. (Fdols) ";; FFdols;  
    "   F-stat(Fdols) ";; Fdols[FFdols]; 
    "";    
                    
"-----------Level shift with trend-----------------------";
model = 2; 
{ CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
                    coint_tsongetal(y, x, model, bwl, kmax, varm, q);
    "Ho: co-integration   (Tsong et al., 2016)";                    
    "   Fourier CIols ";; CIfols;;  cv_fourier';
    "   Freq. (Fols)  ";; FFols;
    "   F-stat (Fols) ";; Fols[FFols];
    "   Fourier CIdols";; CIfdols;;cv_fourier';
    "   Freq. (Fdols) ";; FFdols;  
    "   F-stat(Fdols) ";; Fdols[FFdols]; 
    "";  
