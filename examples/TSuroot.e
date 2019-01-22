
new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model=1;                  

/*
** Maximum number of lags for ds; 
** 0=no lags
*/
pmax =12;                 

// Maximum number of Fourier
fmax = 3;        

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic   = 3;                 

// Trimming rate
trimm= 0.10;             

// Long-run consistent variance estimation method
varm = 3;

format /m1 /rd 8,4;

{ADFtau,ADFp}      = ADF(y,model,pmax,ic);
{Zt,Za}            = PP(y,model,varm);
{GLStau,GLSp}      = DFGLS(y,model,pmax,ic);
{Pt,lrv}           = ERSpt(y,model,varm);
{Mza,Mzt,MSB,MPT}  = MGLS(y,model,varm);
"ADF &  lag     ";;ADFtau~ADFp;
"PP tests       ";
"  Zt           ";;Zt;
"  Za           ";;Za;
"ERS tests      ";
"  DF-GLS & lag ";;GLStau~GLSp;
"  PT           ";;PT;
"MGLS tests     ";
"  MZa          ";;MZa;
"  MZt          ";;MZt;
"  MSB          ";;MSB;
"  MPT          ";;MPT;

if model==1; "--------Model A: Break in level        -----"; endif;
if model==2; "--------Model A: Break in level & trend-----"; endif;
    
"One break ADF test (Zivot & Andrews, 1992)";
    {ADF_min,tb1,p,cv}=ADF_1break(y,model,pmax,ic,trimm);
    "       ADF-stat        ";;ADF_min;
    "       Break date      ";;tb1;
    "       Fraction (λ)    ";;tb1/rows(y);
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv';
"";

"Two breaks ADF test (Narayan & Popp, 2010)";
    {ADF_min,tb1,tb2,p,cv}=ADF_2breaks(y,model,pmax,ic,trimm);
    "       ADF-stat        ";;ADF_min;
    "       Break dates     ";;tb1~tb2;
    "       Fractions (λ)   ";;tb1/rows(y)~tb2/rows(y);
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv';
"";
    
"Fourier ADF test (Enders & Lee, 2012)";
    {ADFstat,f,p,cv}=Fourier_ADF(y,model,pmax,fmax,ic);    
    "       ADF-stat        ";;ADFstat;
    "       Fourier         ";;f;
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv;
"";    
    
"One break LM test (Lee & Strazicich, 2013)";
    {LM_min,tb1,p,lambda,cv}=LM_1break(y,model,pmax,ic,trimm);
    "       LM-stat         ";;LM_min;
    "       Break date      ";;tb1;
    "       Fraction (λ)    ";;lambda;
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv;
    " ";

"Two breaks LM test (Lee & Strazicich, 2003)";
    {LM_min,tb1,tb2,p,cv}=LM_2breaks(y,model,pmax,ic,trimm);
    "       LM-stat         ";;LM_min;
    "       Break dates     ";;tb1~tb2;
    "       Fraction        ";;tb1/rows(y)~tb2/rows(y);
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv;
    "";

"Fourier LM test (Enders & Lee, 2012)";
    {LMstat,f,p,cv}=Fourier_LM(y,pmax,fmax,ic);    
    "       LM-stat         ";;LMstat;
    "       Fourier         ";;f;
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv;
    "";
  
"Fourier GLS test (Rodrigues & Taylor, 2012)";
     {GLSstat,f,p,cv}=Fourier_GLS(y,model,pmax,fmax,ic);    
    "       GLS-stat        ";;GLSstat;
    "       Fourier         ";;f;
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv;
    ""; 

"One break KPSS test (Kurozumi, 2002)";
    {KPSS,tb1,lambda,cv}=KPSS_1break(y,model,varm);
    "       KPSS test       ";;KPSS;
    "       Break date      ";;tb1;
    "       Fraction        ";;lambda;
    "       CV (10%, 5%, 1%)";;cv;
"";

"Two breaks KPSS test (CiS & Sanso, 2007)";
    {KPSS,tb1,tb2,cv}=KPSS_2breaks(y,model,varm);

    "       KPSS test       ";;KPSS;
    "       Break dates     ";;tb1~tb2;
    "       Fraction        ";;tb1/rows(y)~tb2/rows(y);
    "       CV (5%)         ";;cv; 
    ""; 

"Fourier KPSS test (Becker, Enders & Lee, 2006)";     
    {k}         =Fourier(y,model,fmax);
    {KPSS,cv}   =Fourier_KPSS(y,model,k,varm);
    "       KPSS-stat       ";;KPSS;
    "       Fourier         ";;k;
    "       CV (1%, 5%, 10%)";;cv;
    "";
 
"RALS-ADF ";
  {tauRALS,p2,cv} = RALSADF(y,model,pmax,ic);
    "       RALS-ADF stat       ";; tauRALS;
    "       p2                  ";; p2;
    "       CV (1%, 5%, 10%)    ";;cv;
  "";
  
"RALS-LM";
{tauRALS,p2,cv} = RALSLM(y,pmax,ic);
    "       RALS-LM stat       ";; tauRALS;
    "       p2                  ";; p2;
    "       CV (1%, 5%, 10%)    ";;cv;
  "";


"Quantile-ADF";
tau   = 0.1;
_print= "true";
{stat} = QRADF(y,model,pmax,ic,tau,_print); 


    
