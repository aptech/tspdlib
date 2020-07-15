
adf
==============================================

Purpose
----------------

Computes the Augmented Dickey Fuller unit root test.

Format
----------------
.. function:: { tstat, lags, cv } = adf(y, model, pmax, ic)


    :param y: Time series data to be test.

    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ==============
          0           No constant or trend.
          1           Constant.
          2           Constant and trend.
          =========== ==============

    :type model: Scalar

    :param pmax: The maximum number of lags for Dy.
    :type pmax: Scalar

    :param ic: The information criterion used for choosing lags.

             =========== ==============
             1           Akaike.
             1           Schwarz.
             2           t-stat significance.
             =========== ==============

    :type ic: Scalar

    :return tstat: Dickey Fuller test statistic.

    :rtype tstat: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return cv: 1, 5, and 10 percent critical values for ADF tau-stat.
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

  /*
  ** 0 = No deterministic component
  ** 1 = With constant
  ** 2 = With constant and trend
  */
  model = 0;

  { ADFtau, ADFp, cvADF }  = ADF(y, model, pmax, ic);

Source
------

adf.src

.. seealso:: Functions :func:`adf_1br`, :func:`adf_2br`
