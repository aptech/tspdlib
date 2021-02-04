new;
cls;
library tspdlib;

// Load date file
y = loadd("D:/development/GitHub/tspdlib/examples/ts_full.dat");
y = setcoldateformats(y, "%m/%Y", "Date");

/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 1;                  
{ ADF_min, tb1, tb2, p, cv } = ADF_2breaks(y, model);
    
/*
** 1=Model A: break in level  
** 2=Model C: break in level and trend
*/
model = 2;                  
{ ADF_min, tb1, tb2, p, cv } = ADF_2breaks(y, model);

