
new;
cls;
library tspdlib; 

// Date dimensions
N    = 24; 
T    = 112; 

// Load date file
y = loadd(__FILE_DIR $+ "PDe.dat");

/*
** Set maximum number of lags for ds
** 0 = no lags
*/
pmax = 5;                

/*
** Information Criterion: 
** 1=Akaike; 
** 2=Schwarz; 
** 3=t-stat sign.
*/
ic   = 1;  

// Trimming rate
trimm = 0.10;  

// Run with no-break
nbreak=0;

// Call PD LM without break
"Panel LM test without shifts";  
{ Nlm, Ntb, Np, PDlm, pval } = PDLMlevel(y, 1, pmax, ic, trimm, nbreak);

// Print results
seqa(1, 1, cols(y))~Nlm~Np;
    PDlm;
    pval;


// Run panel LM test with level shifts 
"Panel LM test with level shifts";  

// Run with one break
nbreak=1;

// Call PD LM with level break
{ Nlm, Ntb, Np, PDlm, pval } = PDLMlevel(y, 1, pmax, ic, trimm, nbreak);

// Print results
seqa(1, 1, cols(y))~Nlm~Ntb~Np;
    PDlm;
    pval;

// Run with two breaks 
nbreak = 2;
{ Nlm, Ntb, Np, PDlm, pval } = PDLMlevel(y, 1, pmax, ic, trimm, nbreak);

// Print results
seqa(1, 1, cols(y))~Nlm~Ntb~Np;
    PDlm;
    pval;

// Run LM test with level and trend shifts
"Panel LM test with level and trend shifts";

// One break
nbreak=1;
{Nlm,Ntb,Np,PDlm,pval}= PDLMtrend(y,2,pmax,ic,trimm,nbreak);
    seqa(1,1,cols(y))~Nlm~Ntb~Np;
    PDlm;
    pval;

// Two breaks    
nbreak=2;
{Nlm,Ntb,Np,PDlm,pval}= PDLMtrend(y,2,pmax,ic,trimm,nbreak);
    seqa(1,1,cols(y))~Nlm~Ntb~Np;
    PDlm;
    pval;

// Panel stationarity test with level shifts
"Panel stationarity test with level shifts";   
model= 1;
k    = 1;
varm = 2;
{Nkpss,FZk,pval}= PDfzk(y,model,k,varm);
    seqa(1,1,cols(y))~Nkpss;
    FZk;
    pval;


// Panic tests
"PANIC tests";   
model= 1;        /* 1=constant, 2= linear trend */   
pmax = 4;        /* max lags for ADF regression*/
kmax = 4;        /* max no of factors for PCA*/
ic   = 2;        /* 1=PCp, 2 =ICp*/

    {ADFe,pval,lags,Pe,nf}=BNG_PANIC(y, pmax, kmax, model, ic);
    {Pa_pc,Pb_pc,PMSB_pc} =BNG_PANICnew(y, kmax, model, ic);
    {Ze,Ze_ba}            =JWL_PANICadj(y, kmax, pmax, model, ic);
    {Pa_ca,Pb_ca,PMSB_ca} =JWR_PANICCA(y,model);

    "PANIC     Stat.   p-value"; 
    "Pe     ";;Pe       ;;1-cdfn(Pe);
    "Pa     ";;Pa_pc    ;;cdfn(Pa_pc);       
    "Pb     ";;Pb_pc    ;;cdfn(Pb_pc);
    "PMSB   ";;PMSB_pc  ;;cdfn(PMSB_pc);
    "Ze     ";;Ze       ;;cdfn(Ze);
    "Ze+    ";;Ze_ba    ;;cdfn(Ze_ba);

    " ";
    "PANICCA   Stat.   p-value"; 
    "Pa     ";;Pa_ca;;cdfn(Pa_ca);       
    "Pb     ";;Pb_ca;;cdfn(Pb_ca);
    "PMSB   ";;PMSB_ca;;cdfn(PMSB_ca);

    "";
    "# Factors";
    "ICp2";;nf[2];
    "";
    "       CS        ADF        p-val        Lags "
    seqa(1,1,N)~ADFe~pval~lags;


// CADF and Modidied CADF tests
model= 1;        /* 1=constant, 2= linear trend */   
pmax = 4;        /* max lags for ADF regression*/
ic   = 3;        /* Information Criterion:
                    1=Akaike
                    2=Schwarz
                    3=t-stat significance */

{Ncadf, Nlm, Nmcadf, Nlags, pcadf, pmcadf} = cips(y, model, pmax, ic);

    "Test            Stat.   p-value"; 
    "CIPS         ";;pcadf;;  "    NA  ";
    "Modified CIPS";;pmcadf;;cdfn(pmcadf);    
    "";
    "    id      CADF     LM       M-CADF   pval    Lags ";
            if model == 1; q=2;  endif;
            if model == 2; q=3;  endif;    
    seqa(1,1,N)~Ncadf~Nlm~Nmcadf~cdfchic(abs(Nmcadf),q)~Nlags;
  
"M-CADF critical values";
"cv (0.01)";; cdfchii(0.99,q);
"cv (0.05)";; cdfchii(0.95,q);
"cv (0.10)";; cdfchii(0.90,q); 
                
