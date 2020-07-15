fourier_lm
==============================================

Purpose
----------------

LM unit root test with Flexible Fourier form structural breaks.

Format
----------------
.. function:: { LMk, k, p, cv } = Fourier_LM(y, pmax, fmax, ic);

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param pmax: Maximum number of lags for Dy; 0=no lag.
    :type pmax: Scalar

    :param fmax: Maximum number of single Fourier frequency (upper bound is 5).
    :type fmax: Scalar

    :param ic: The information criterion used for choosing lags.
    =========== ====================
    1           Akaike.
    2           Schwarz.
    3           t-stat significance.
    =========== ====================
    :type ic: Scalar

    :return lmk: LM(k) statistic.
    :rtype lmk: Scalar

    :return k: Number of single frequency.
    :rtype k: Scalar

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

  // Maximum number of Fourier
  fmax = 3;

  format /m1 /rd 8,4;

  /*
  ** 1 = With constant
  ** 2 = With constant and trend
  */
  model = 1;

  "Fourier LM test (Enders & Lee, 2012)";
  { LMstat, f, p, cv } = Fourier_LM(y, pmax, fmax, ic);
  "       LM-stat         ";;
  LMstat;
  "       Fourier         ";;
  f;
  "       Lag             ";;
  p;
  "       CV (1%, 5%, 10%)";;
  cv;
  "";

Source
------

fourier_lm.src

.. seealso:: Functions :func:`fourier_adf, `fourier_gls`, `fourier_kpss`
