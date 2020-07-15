fourier_kpss
==============================================

Purpose
----------------

KPSS stationarity test with Flexible Fourier form structural breaks.

Format
----------------
.. function:: { KPSSk, k, cv } = fourier_gls(y, model, fmax, bwl, varm)


    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ====================
          1           Constant
          2           Constant and trend
          =========== ====================

    :type model: Scalar

    :param fmax: Maximum number of single Fourier frequency (upper bound is 5).
    :type fmax: Scalar

    :param bwl: Bandwidth for spectral window.
    :type bwl: Scalar

    :param varm: Bandwidth for spectral window.
    =========== ==========================
    1           iid
    2           Bartlett
    3           Quadratic Spectral (QS)
    4           SPC with Bartlett
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

  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "TSe.dat");
  T = rows(y);

  // bandwidth lag
  bwl = round(4 * (T/100)^(2/9));

  /*
  ** Information Criterion:
  ** 1=Akaike;
  ** 2=Schwarz;
  ** 3=t-stat sign.
  */
  ic = 3;

  // Maximum number of Fourier
  fmax = 3;

  format /m1 /rd 8,4;

  // Set long run variance method
  varm = 1;

  /*
  ** 1 = With constant
  ** 2 = With constant and trend
  */
  model = 1;

  "Fourier KPSS test (Becker, Enders & Lee, 2006)";
  { KPSS, k, cv } = Fourier_KPSS(y, model, fmax, bwl, varm);
  "       KPSS-stat       ";;KPSS;
  "       Fourier         ";;k;
  "       CV (10%, 5%, 1%)";;cv;
  "";

Source
------

fourier_kpss.src

.. seealso:: Functions :func:`fourier_adf, `fourier_gls`, `fourier_lm`
