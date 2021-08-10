
adf
==============================================

Purpose
----------------

Computes the Augmented Dickey Fuller unit root test.

Format
----------------
.. function:: { tstat, lags, cv } = adf(y, model[, pmax, ic])
    :noindexentry:

    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

        =========== ==============
        0           No constant or trend.
        1           Constant.
        2           Constant and trend.
        =========== ==============

    :type model: Scalar

    :param pmax: Optional, the maximum number of lags for :math:`\delta y`. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

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
  y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y");

  // No deterministic component
  model = 0;

  { ADFtau, ADFp, cvADF } = ADF(y, model);

Source
------

adf.src

.. seealso:: Functions :func:`adf_1br`, :func:`adf_2br`
