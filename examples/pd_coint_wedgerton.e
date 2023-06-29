new;
library tspdlib_dv;

// Load data
dat = loadd(__FILE_DIR $+ "pd_coint.gdat");

x = dat[., 1:5];
y = dat[., 5+1:cols(dat)];


 // Deterministic component
 //  0 = no shift, 
 // 1 = level shift, 
 // 2 = regime shift
mod = 1;                       

{ brks, lmn, nf } = pd_coint_wedgerton(y, x, mod);

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
seqa(1, 1, cols(y))~brks';

