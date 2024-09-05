pd_cause
==============================================

Purpose
----------------

Computes tests for Granger causality in heterogeneous mixed panels with bootstrap critical values.

Format
----------------
.. function:: pd_stat = pd_cause(data, Ncross, test [, pmax, dmax, ic, Nboot, vnames])
    :noindexentry:

    :param data: Data to be tested with 2 individual variables each in a separate column. Data should be long format panel data. 
    :type data: (N*T)x2 matrix

    :param Ncross: Number of cross sections.
    :type Ncross: Scalar

    :param test: The panel data causality test to be implemented.
    
          =========== =====================
          "fisher"    Fisher test.
          "zhnc"      Panel Zhnc statistic.
          "surwald"   Panel SUR Wald statistic.
          =========== =====================
    
    :type test: String
    
    :param pmax: Optional, maximum number of lags. Default = 8.
    :type pmax: Scalar

    :param dmax: Optional, maximum integration degree of variables. Default = 1.
    :type dmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 1.

          =========== =====================
          1           Akaike.
          2           Schwarz.
          3           t-stat significance.
          =========== =====================

          Default = 2.
    :type ic: Scalar

    :param Nboot: Optional, Number of bootstrap replications. Default = 1000.
    :type Nboot: Scalar

    :param vnames: Variable names.
    :type vnames: String array

    :return cause_stat: Panel causation statistics. Prints individual results and bootstrap critical values.
    :rtype cause_stat: Dataframe


Examples
--------

::

  library tspdlib;

  /* Load data
  ** This data is long format panel data. It contains observations for 
  ** two variables across 9 different cross-sections. 
  */
  data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pdcause.dat");

  // Number of cross-sections
  N = 9;  

  /*
  ** Run Fisher test
  */
  test = "fisher";

  // Call test
  cause_stat = pd_cause(data, N, test);

  /*
  ** Run Zh and Zn test
  */
  test = "zhnc";

  // Call test
  cause_stat = pd_cause(data, N, test);

  /*
  ** Run SURwald test
  */
  test = "surwald";

  // Call test
  cause_stat = pd_cause(data, N, test);

Source
------

pd_cause.src

.. seealso:: Functions :func:`granger`, :func:`panel_fisher`, :func:`panel_zhnc`, :func:`panel_surwald`
