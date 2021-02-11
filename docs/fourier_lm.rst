fourier_lm
==============================================

Purpose
----------------

LM unit root test with Flexible Fourier form structural breaks.

Format
----------------
.. function:: { LMk, k, p, cv } = Fourier_LM(y[, pmax, fmax, ic])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param pmax: Optional, maximum number of lags for Dy; 0=no lag. Default = 8.
    :type pmax: Scalar

    :param fmax: Optional, maximum number of single Fourier frequency (upper bound is 5). Default = 5.
    :type fmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.
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
  y = loadd(__FILE_DIR $+ "ts_examples.csv", "Y + date($Date, '%b-%y')");


  { LMstat, f, p, cv} = Fourier_LM(y);

Source
------

fourier_lm.src

.. seealso:: Functions :func:`fourier_adf, `fourier_gls`, `fourier_kpss`

