fourier_gls
==============================================

Purpose
----------------

Local generalized lease squares unit root test with Flexible Fourier form structural breaks.

Format
----------------
.. function:: { GLSk, k, p, cv } = fourier_gls(y, model, pmax, fmax, ic)


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

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.
    =========== ========================
    1           Akaike.
    2           Schwarz.
    3           t-stat significance.
    =========== ========================
    :type ic: Scalar

    :return GLSk: GLS(k) statistic.
    :rtype GLSk: Scalar

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

  "Fourier GLS test (Rodrigues & Taylor, 2012)";
  { GLSstat, f, p, cv } = Fourier_GLS(y, model, pmax, fmax, ic);
  "       GLS-stat        ";;
  GLSstat;
  "       Fourier         ";;
  f;
  "       Lag             ";;
  p;
  "       CV (1%, 5%, 10%)";;
  cv;
  "";



Source
------

fourier_gls.src

.. seealso:: Functions :func:`fourier_adf`, `fourier_kpss`, `fourier_lm`
