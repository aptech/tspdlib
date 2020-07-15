fourier_ADF
==============================================

Purpose
----------------

Dickey-Fuller unit root test with Flexible Fourier form structural breaks.

Format
----------------
.. function:: { ADFk, k, p, cv } = Fourier_ADF(y, model, pmax, fmax, ic)


    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ====================
          1           Constant
          2           Constant and trend
          =========== ====================

    :type model: Scalar

    :param pmax: Maximum number of lags for Dy; 0=no lag.
    :type pmax: Scalar

    :param fmax: Maximum number of single Fourier frequency (upper bound is 5).
    :type fmax: Scalar

    :param ic: The information criterion used for choosing lags.
    =========== =====================
    1           Akaike.
    2           Schwarz.
    3           t-stat significance.
    =========== =====================
    :type ic: Scalar

    :return ADF: ADF(k) statistic.
    :rtype ADF: Scalar

    :return k: Number of single frequency.
    :rtype k: Scalar

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

  "Fourier ADF test (Enders & Lee, 2012)";
  { ADFstat, f, p, cv } = Fourier_ADF(y, model, pmax, fmax, ic);
  "       ADF-stat        ";;
  ADFstat;
  "       Fourier         ";;
  f;
  "       Lag             ";;
  p;
  "       CV (1%, 5%, 10%)";;
  cv;
  "";


Source
------

fourier_adf.src

.. seealso:: Functions :func:`coint_egranger`
