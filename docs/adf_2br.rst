
adf_2br
==============================================

Purpose
----------------

Computes the Augmented Dickey Fuller unit root test with two structural breaks.

Format
----------------
.. function:: { tstat, tb1, tb2, lags, cv } = adf_2br((y, model[, pmax, ic, trimm])


    :param y: Time series data to be test.

    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ==============
          1           Break in level.
          2           Break in level and trend.
          =========== ==============

    :type model: Scalar

    :param pmax: Optional, the maximum number of lags for Dy. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

             =========== ==============
             1           Akaike.
             2          Schwarz.
             3          t-stat significance.
             =========== ==============
             Default = 3;

    :type ic: Scalar

    :param trimm: Optional, trimming rate. Default = 0.10.
    :type trimm: Scalar

    :return tstat: Minimum test statistic.
    :rtype tstat: Scalar

    :return tb1: Location of first break.
    :rtype tb1: Scalar

    :return tb2: Location of second break.
    :rtype tb2: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return cv: 1, 5, and 10 percent critical values for :func:`adf_2br` t-stat.
    :rtype cv: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y + date($Date, '%b-%y')");


  // Break in level
  model = 1;

  { ADF_min, tb1, tb2, lags, cv } = adf_2break(y, model);

Source
------

adf_2br.src

.. seealso:: Functions :func:`adf`, :func:`adf_1br`
