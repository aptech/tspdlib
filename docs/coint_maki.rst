
coint_maki
==============================================

Purpose
----------------

Computes the test of the null hypothesis of no cointegration against the alternative of cointegration with an unknown number of breaks.

Format
----------------
.. function:: tst = coint_maki(y, m, model[, trimm, lagoption])
    :noindexentry:

    :param y: Data to be tested.
    :type y: Nxk matrix

    :param m: Maximum number of breaks.
    :type m: Scalar

    :param model: Model to be implemented.

          =========== =========================
          0           Level shift
          1           Level shift with trend
          2           Regime shift
          3           Regime shift with trend
          =========== =========================

    :type model: Scalar

    :param trimm: Optional, trimming rate. Default = 0.10.
    :type trimm: Scalar

    :param lagoption: Optional, lag selection criteria. Default = 1.

          =========== ==================
          0           No lags
          1           T-stat criterion
          =========== ==================

    :type lagoption: Scalar.

    :return tst: Test statistic
    :rtype tst: Scalar

Examples
--------

::

  /*
  ** This example program tests for cointegration
  ** with alternatives hypothesis up to m structural breaks
  */
  new;
  cls;
  library tspdlib;

  // Load dataset
  data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv",
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");


  // Set the maximum number of breaks
  m = 3;

  /*
  ** Set the model
  **   0: level shift
  **   1: level shift with trend
  **   2: regime shifts
  **   3: Trend and Regime shifts
  */
  model = 2;

  // Perform test
  call coint_maki(datap, m, model);


Source
------

coint_maki.src

.. seealso:: Functions :func:`coint_egranger`, :func:`coint_ghansen`, :func:`coint_hatemij`
