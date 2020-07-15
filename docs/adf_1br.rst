
adf_1br
==============================================

Purpose
----------------

Computes the Augmented Dickey Fuller unit root test with one structural break.

Format
----------------
.. function:: { tstat, tb, lags, cv } = adf_1br(y, model, pmax, ic, trimm)


    :param y: Time series data to be test.

    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ==============
          1           Break in level.
          2           Break in level and trend.
          =========== ==============

    :type model: Scalar

    :param pmax: The maximum number of lags for Dy.
    :type pmax: Scalar

    :param ic: The information criterion used for choosing lags.
    =========== ==============
    1           Akaike.
    2           Schwarz.
    3           t-stat significance.
    =========== ==============
    :type ic: Scalar

    :param trimm: Trimming rate.
    :type trimm: Scalar

    :return tstat: Minimum test statistic.
    :rtype tstat: Scalar

    :return tb: Location of break.
    :rtype tb: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return cv: 1, 5, and 10 percent critical values for :func:`adf_1br` tau-stat.
    :rtype cv: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "TSe.dat");

  /*
  ** Maximum number of lags for ds;
  ** 0=no lags
  */
  pmax = 12;

  /*
  ** Information Criterion:
  ** 1=Akaike;
  ** 2=Schwarz;
  ** 3=t-stat sign.
  */
  ic = 3;

  // Trimming rate
  trimm = 0.10;

  /*
  ** 1 = Break in level
  ** 2 = Break in level and trend
  */
  model = 1;

  { ADF_min, tb1,lags, cv } = adf_1break(y, model, pmax, ic, trimm);

Source
------

adf_1br.src

.. seealso:: Functions :func:`adf`, :func:`adf_2br`
