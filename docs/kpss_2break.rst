
kpss_2break
==============================================

Purpose
----------------

Computes the KPSS stationary test with two structural breaks.

Format
----------------
.. function:: { kpss_stat, tb, lambda, cv } = KPSS_2break(y, model)
    :noindexentry:

    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ===========================
          1           Break in level.
          2           Break in level and trend.
          =========== ===========================

    :type model: Scalar

    :param bwl: Optional, bandwidth for the spectral window. Default = round(4 * (T/100)^(2/9)).
    :type  bwl: Scalar

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.

          =========== =====================================================
          1           iid.
          2           Bartlett.
          3           Quadratic Spectral (QS).
          4           SPC with Bartlett (Sul, Phillips & Choi, 2005)
          5           SPC with QS
          6           Kurozumi with Bartlett
          7           Kurozumi with QS
          =========== =====================================================

    :type varm: Scalar

    :param trimm: Optional, trimming rate. Default = 0.10.
    :type trimm: Scalar

    :return kpss_stat: The KPSS test statistic with two breaks.
    :rtype kpss_stat: Scalar

    :return tb1: Location of the first break.
    :rtype tb1: Scalar

    :return tb1: Location of the second break.
    :rtype tb1: Scalar

    :return cv: 1, 5, and 10 percent critical values for :func:`kpss_2break` statistic.
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
  { KPSS, tb1, tb2, cv } = KPSS_2breaks(y, model);

  // Break in level and trend
  model = 2;
  { KPSS, tb1, tb2, cv } = KPSS_2breaks(y, model);

Source
------

kpss_1br.src

.. seealso:: Functions :func:`lmkpss`, :func:`kpss_2break`
