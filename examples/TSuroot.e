
new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "ts_full.dat");
y = setcoldateformats(y, "%m/%Y", "Date");

/*
** Traditional tests without breaks
*/

/*
** Model with constant and trend
*/
model = 2;
screen off;
{ ADFtau, ADFp, cvADF } = ADF(y, model);
{ Zt, Za, cvZt, cvZa }  = PP(y, model);
{ GLStau, GLSp, cvGLS } = DFGLS(y, model);
{ Pt,lrv, cvPt }        = ERSpt(y, model);
{ MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT}  
                        = MGLS(y, model);
{ LMtau, LMp, cvLM }    = LM(y);
{ KPSS, cvKPSS }          = LMkpss(y, model);
screen on;

"Test      Stat.   cv(1%)   cv(5%)   cv(10%)   Lag  ";
"--------------------------------------------------";
"ADF   " ;; ADFtau ;; cvADF ;; ADFp ; 
"Zt    " ;; Zt     ;; cvZt; 
"Za    " ;; Za     ;; cvZa;
"DFGLS " ;; GLStau ;; cvGLS ;; GLSP ;
"PT    " ;; PT     ;; cvPt;
//"HAC variance "   ;; lrv;
"MZa   " ;; MZa    ;; cvMZA;
"MZt   " ;; MZt    ;; cvMZt;
"MSB   " ;; MSB    ;; cvMSB;
"MPT   " ;; MPT    ;; cvMPT;
"LM    " ;; LMtau  ;; cvLM ;; LMp ; 
"KPSS  " ;; KPSS   ;; cvKPSS; 

"";

/*
** Tests with breaks
*/

/*
** Break in level and trend
*/
model = 2;

// Innovational outlier
outlier = 1;
{ ADF_min, tb1, p, cv } = ADF_1break(y, model);

{ ADF_min, tb1, tb2, p, cv } = ADF_2breaks(y, model);

{ ADFstat, f, p, cv } = Fourier_ADF(y, model);    

{ LM_min, tb1, p, lambda, cv } = LM_1break(y, model);

{ LM_min, tb1, tb2, p, cv } = LM_2breaks(y, model);

{ LMstat, f, p, cv } = Fourier_LM(y);    

{ GLSstat, f, p, cv } = Fourier_GLS(y, model);    

{ KPSS, tb1, lambda, cv} = KPSS_1break(y, model);

{KPSS,tb1,tb2,cv} = KPSS_2breaks(y, model);

{ KPSS, k, cv } = Fourier_KPSS(y, model);

{ tauRALS, p2, cv } = RALSADF(y, model);

{ tauRALS, p2, cv } = RALSLM(y);

"Quantile ADF";  
tau    = 0.1;
_print = "true";
QUR_adf = QRADF(y, 1, 12, 3, tau, _print);


    
