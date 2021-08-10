fourier_kpss
==============================================

Purpose
----------------

KPSS stationarity test with Flexible Fourier form structural breaks.

Format
----------------
.. function:: { KPSSk, k, cv } = fourier_kpss(y, model[, fmax, bwl, varm])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ====================
          1           Constant
          2           Constant and trend
          =========== ====================

    :type model: Scalar

    :param fmax: Optional, maximum number of single Fourier frequency (upper bound is 5). Default = 5.
    :type fmax: Scalar

    :param bwl: Optional, bandwidth for spectral window. Default = round(4 * (T/100)^(2/9)).
    :type bwl: Scalar

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.
    =========== ==========================
    1           iid
    2           Bartlett
    3           Quadratic Spectral (QS)
    4           SPC with Bartlett (Sul, Phillips & Choi, 2005)
    5           SPC with QS
    6           Kurozumi with Bartlett
    7           Kurozumi with QS
    =========== ==========================
    :type varm: Scalar

    :return KPSSk: KPSS(k) statistic.
    :rtype KPSSk: Scalar

    :return p: number of lags selected by chosen information criterion
    :rtype p: Scalar

    :return cv: 1%, 5%, 10% critical values for the chosen model
    :rtype cv: Vector

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y + date($Date, '%b-%y')");

  // With constant
  model = 1;

  "Fourier KPSS test (Becker, Enders & Lee, 2006)";
  { KPSS, k, cv } = Fourier_KPSS(y, model);

Source
------

fourier_kpss.src

.. seealso:: Functions :func:`fourier_adf, :func:`fourier_gls`, :func:`fourier_lm`
