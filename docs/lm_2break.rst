
lm_2break
==============================================

Purpose
----------------

Computes the minimum LM unit root test with one structural break.

Format
----------------
.. function:: { lm_tstat, tb1, tb2, lags, cv } = LM_2break(y, model[, pmax, ic, trimm])
    :noindexentry:

    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

        =========== ===========================
        1           Break in level.
        2           Break in level and trend.
        =========== ===========================

    :type model: Scalar

    :param pmax: Optional, the maximum number of lags for Dy. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.
        =========== ======================
        1           Akaike.
        2           Schwarz.
        3           t-stat significance.
        =========== ======================

    :type ic: Scalar

    :param trimm: Optional, trimming rate. Default = 0.10.
    :type trimm: Scalar

    :return lm_tstat: Minimum test statistic with two breaks.
    :rtype lm_tstat: Scalar

    :return tb1: Location of first break.
    :rtype tb1: Scalar

    :return tb1: Location of second break.
    :rtype tb1: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return cv: 1, 5, and 10 percent critical values for :func:`lm_1break` tau-stat.
    :rtype cv: Vector

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y + date($Date, '%b-%y')");

  // Break in level
  model = 1;
  { LM_min, tb1, tb2, p, cv } = LM_2break(y, model);

  // Break in level and trend
  model = 2;
  { LM_min, tb1, tb2, p, cv } = LM_2break(y, model);

Source
------

lm_1br.src

.. seealso:: Functions :func:`lm`, :func:`lm_1break`

