new;
library westerlundlib;

n = 16;

// Load data
dat = loadd(__FILE_DIR $+ "panelcoint.dat");

y = dat[., 1:n];
x = dat[.,n+1:cols(dat)];

// Dimensions
t = rows(y);

// Max factors
max     = 5;         

 // Deterministic component
 //  0 = no shift, 
 // 1 = level shift, 
 // 2 = regime shift
mod     = 0;                       

// Lags
p       = int(4*(t/100)^(2/9));     

// Bandwidth
q       = int(4*(t/100)^(2/9));     

// Trimming
tr      = 0.1;                    

// Find break points
brn      = ilt_br(y, x, tr, p, mod);

// Estimate test statistic
{ lmn, nf } = ilt_fact(y, x, brn, p, q, mod, max);


format/m1/rd 8,3;

print " ";
print " tau_n   = ";; lmn[1]; 
print " p-value = ";; (1-cdfnc(lmn[1]));  
print " phi_n   = ";; lmn[2];
print " p-value = ";; (1-cdfnc(lmn[2]));  
print " ";
print " estimated no of factors = ";; nf;
print " ";
print " estimated breakpoints ";
seqa(1, 1, n)~brn';

