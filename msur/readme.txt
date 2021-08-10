@ Maximo Camacho
  www.um.es/econometria/Maximo
  February, 13th 2006   @

This README file tries to clarify the GAUSS codes used to elaborate the paper "Markov-switching models and the unit root hypothesis in real U.S. GDP".

1.- The file gdp.txt contains real GDP (downloaded from Federal Reserve Bank of St. Louis) from 1947.1 to 2009.4

2.- SWAR_det_t.gau estimates the trend stationary process that appears in expression (3).
3.- SWAR_ur.gau estimates the difference stationary process that appears in expression (4).
4.- ADF.gau computes the Augmented Dickey-Fuller (ADF) test.
5.- SW_ADF_sim.gau computes the Markov-switching ADF test (p-value calculated from Monte Carlo simulation)
6.- SW_ADF_boot.gau computes the Markov-switching ADF test (p-value calculated from bootstraping the residuals)


If you have any problem, please do not hesitate to contact to me.  

If you use this programme for a paper, please cite the author's and his web page.

Good luck,

PS: Remember, any GAUSS code works at the first try.
