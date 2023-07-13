
sbvar_icss
==============================================

Purpose
----------------

Identifies structural breaks in variance using the Iterated Cumulative Sums of Squares (ICSS) algorithm for of Inclan and Tiao (JASA, 1994).

Format
----------------
.. function:: { change_point, nbreaks } = sbvar_icss(e [, test, bwl, varm ])
    :noindexentry:

    :param e: Zero mean stochastic process to be analysed.
    :type e: Tx1 vector

    :param test: Optional, the test to be conducted:

        =========== ====================================================
        0           Inclan-Tiao test (Default).
        1           kappa1 test.
        2           kappa2 test. 
        =========== =====================================================

    :type test: Scalar

    :param bwl: Optional, bandwidth for spectral window. Default = round(4 * (T/100)^(2/9)).
    :type bwl: Scalar

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.

        =========== =================================================
        1           iid
        2           Bartlett
        3           Quadratic Spectral (QS)
        4           SPC with Bartlett (Sul, Phillips & Choi, 2005)
        5           SPC with QS
        6           Kurozumi with Bartlett
        7           Kurozumi with QS
        =========== =================================================

    :type varm: Scalar
        
    :return change_point: The change points (the first and the last element denotes the first and the last time periods of the time series). 
    :rtype change_point: Vector
           
    :return nbreaks: The number of change points. 
    :rtype nbreaks: Scalar     

Examples
--------

::

  library tspdlib;

  // Load S&P data
  FRED_API_KEY = "7a756a099f64c52f4657b4accc942137";
  x = packr(fred_load("SP500"));

  // Compute returns
  ret_sp500 = (x[2:rows(x), "SP500"] - x[1:rows(x)-1, "SP500"])./x[1:rows(x)-1, "SP500"];

  // Demean the returns
  e = ret_sp500 - meanc(ret_sp500);

  // Run ICSS test
  { cp, nbre } = sbvar_icss(x[2:rows(x), "date"]~e);

Source
------

sbvar_icss.src
