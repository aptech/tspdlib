/* This GAUSS file computes MS-ADF test by bootstraping
dYt = ro*Yt-1 + C(st) + B*t + A(L)*dYt-1 + Et
Et ~ N(0,V) */

new;
format/rd 1,4;

library tspdlib, optmt, pgraphtranslate;

// Load data
data = loadd("GDP.dat");

// Separate lGDP data
y = data[., 1];
dy = data[., 2];

// Set autoregressive order
pphi = 1;

// Set up initial values
c1 = 1.47;
c2 = -0.02;
be = -0.03;
phi1 = 0.15;
sig1 = 0.75;
p11 = 4;
p22 = 2;
startval0=c1|c2|be|phi1*ones(pphi,1)|sig1|p11|p22;

ro=-0.0520;
c1=40.1358;
c2=38.3426;
be=0.3929;
phi1=0.2206;
sig1=0.7371;
p11=4.1116;
p22=1.1610;
startval=ro|c1|c2|be|phi1*ones(pphi,1)|sig1|p11|p22;

// Control parameters
struct msurControl msurCtl;
msurCtl = msurControlCreate();

// Set up optimization control parameters
msurCtl.oCtl.algorithm = 2;
msurCtl.oCtl.maxIters = 500;
msurCtl.oCtl.printIters = 1;
msurCtl.oCtl.randRadius = 0;
msurCtl.oCtl.tol = 1e-3;

// Set up other contrl parameters
msurCtl.startvalSimulations = -0.0041|1.7770|0.2395|-0.0043|0.0735|0.7495|4|2;

// Set up graphing requirements
graphset;
pqgwin many;
_pcolor = 4|3;
_pltype = 6;
_pmcolor = 0|0|1|1|1|0|0|0|15;

// Call MSUR procedure
struct msurOut mOut;
mOut = msur(y, dy, pphi, startval, startval0, msurCtl);

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++
GRAPHS
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
if graphs ne 0;
    @ title("log-level");
    xy(seqa(1,1,rows(dyg)),dyg);
    title("log-differences");
    xy(seqa(1,1,rows(dy)),dy);@
    title("Filtered probabilities of state 2");
    xy(seqa(1, 1, rows(mOut.skif)), mOut.skif[., 2]);
    if smooth ne 0;
        title("Smoothed probabilities of state 2");
        xy(seqa(1, 1, rows(mOut.skis)), mOut.skis[., 2]);
    endif;
endif;
