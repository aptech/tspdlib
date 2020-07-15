
coint_maki
==============================================

Purpose
----------------

Tests for cointegration with an unknown number of breaks.

Format
----------------
.. function:: tst = coint_maki(y, m, model, trimm, lagoption)


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

    :param trimm: Trimming rate.
    :type trimm: Scalar

    :param lagoption: Trimming rate.
    =========== ==============
    0           No lags
    1           T-stat criterion
    =========== ==============

    :type lagoption: Scalar

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

  // Set fname to name of dataset
  fname = "nelsonplosser.dta";

  // Add the full path to this code file
  // to the front of 'fname'
  fname = __FILE_DIR $+ fname;

  // Load three variables from the dataset
  datap = loadd(fname, "m + bnd + sp500");

  // Remove all rows with missing values
  datap = packr(datap);


  // Set the maximum number of breaks
  m = 2;

  /*
  ** Set the model
  **   0: level shift
  **   1: level shift with trend
  **   2: regime shifts
  **   3: Trend and Regime shifts
  */
  model = 2;

  /*
  ** Set the trimming parameter
  **   This should be a percentage between
  **   0 and 1. 0.05 represents 5%
  */
  trimm = 0.05;

  /*
  ** Set lagoption
  **   0: lag=0
  **   1: t-sig criterion
  */
  lagoption = 1;

  // Perform test
  call coint_maki(datap, m, model, trimm, lagoption);


Source
------

coint_maki.src

.. seealso::
