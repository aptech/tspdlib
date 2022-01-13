
lm_1break
==============================================

Purpose
----------------

Computes the minimum LM unit root test with one structural break.

Format
----------------
.. function:: { lm_tstat, tb, lags, lambda, cv } = LM_1break(y, model[, pmax[, ic[, trimm]]])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ===========================
          1           Break in level.
          2           Break in level and trend.
          =========== ===========================

    :type model: Scalar

    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
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

    :return lm_tstat: Minimum test statistic.
    :rtype lm_tstat: Scalar

    :return tb: Location of break.
    :rtype tb: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return lambda: Break fraction (tb/T).
    :rtype lambda: Scalar

    :return cv: 1%, 5%, and 10% critical values for :func:`lm_1break` :math:`\tau`-stat..
    :rtype cv: Vector

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");

  // Break in level
  model = 1;
  { LM_min, tb1, p, lambda, cv } = LM_1break(y, model);

  // Break in level and trend
  model = 2;
  { LM_min, tb1, p, lambda, cv } = LM_1break(y, model);

Source
------

lm_1br.src

.. seealso:: Functions :func:`lmkpss`, :func:`lm_2break`
