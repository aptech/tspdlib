
pd_stationary
==============================================

Purpose
----------------

Computes panel data stationarity tests. 

Format
----------------
.. function:: { Nkpss, W, P, Pm, Z } = pd_stationary(y [, model, test, varm, bwl, fmax, ICk])
    :noindexentry:

    :param y: Wide format panel data.
    :type y: TxN matrix

    :param model: Optional, model to be implemented.

        =========== ================================
        1           Constant.
        2           Constant and trend.
        =========== ================================

    :type model: Scalar

    :param test: Optional, specifies type of panel stationarity test to run. 
    :type test: String
    
    
          =========== =====================================================
          "st"        Stationary tests, no modifications. (Default).
          "ca"        Based on CA (cross-section averages approach).
          "fourier"   CA approach with smooth breaks (fourier approach).
          "panic"     Based on PANIC approach.
          =========== =====================================================

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.

          =========== =====================================================
          1           iid.
          2           Bartlett.
          3           Quadratic Spectral (QS).
          4           SPC with Bartlett (Sul, Phillips & Choi, 2005).
          5           SPC with QS.
          6           Kurozumi with Bartlett.
          7           Kurozumi with QS.
          =========== =====================================================

    :type varm: Scalar
    
    :param bwl: Optional, bandwidth for the spectral window. Default = round(4 * (T/100)^(2/9)).
    :type  bwl: Scalar

    :param fmax: Optional, maximum number of single Fourier frequency (upper bound is 5). Default = 5.
    :type fmax: Scalar
    
    :param ICk: Optional, Information Criterion for optimal number of factors. Default = 1.
  
        =========== ================================
        1           PCp criterion.
        2           ICp criterion.
        =========== ================================
      
    :type ick: Scalar
        
    :return Nkpss: Contains the KPSS statistics for each cross-section and the corresponding p-values.
    :rtype Nkpss: Dataframe

    :return W: Panel stationarity statistic by Hadri (2000) and the corresponding p-value.
    :rtype W: Dataframe

    :return P: Panel stationarity statistic by Yin & Wu (2001) and the corresponding p-value.
    :rtype P: Dataframe

    :return Pm: Panel stationarity statistic by Nazlioglu et al. (2021) and the corresponding p-value.
    :rtype Pm: Dataframe

    :return Z: Panel stationarity statistic by Nazlioglu et al. (2021) and the corresponding p-value.
    :rtype Z: Dataframe

Examples
--------

Standard tests
+++++++++++++++++++++++++

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", ". + date($Date, '%b-%y')");

  /*
  ** Classical panel stationarity test
  */
  // With constant
  model = 1;
  { Nkpss, W, P, Pm, Z} = pd_stationary(y, model);

  // With constant and trend
  model = 2;
  { Nkpss, W, P, Pm, Z} = pd_stationary(y, model);

Cross-section approach panel stationarity test
+++++++++++++++++++++++++++++++++++++++++++++++

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", ". + date($Date, '%b-%y')");

  /*
  ** Cross-section approach panel stationarity test 
  */

  // Set test
  test = "ca";

  // With constant
  model = 1;

  { Nkpss, W, P, Pm, Z} = pd_stationary(y, model, test);

Source
------

pd_pst.src

.. seealso:: Functions :func:`pd_kpss`,
