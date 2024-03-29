fourier_lm
==============================================

Purpose
----------------

Computes the LM unit root test with flexible Fourier form structural breaks.

Format
----------------
.. function:: { LMk, f, p, cv } = Fourier_LM(y[, pmax, fmax, ic])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param pmax: Optional, maximum number of lags for :math:`\Delta y`; 0=no lag. Default = 8.
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

    :return f: Number of single frequency.
    :rtype f: Scalar

    :return p: number of lags selected by chosen information criterion
    :rtype p: Scalar

    :return cv: 1%, 5%, 10% critical values for the chosen model
    :rtype cv: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");

  // Call test
  { LMstat, f, p, cv } = Fourier_LM(y);

Source
------

fourier_lm.src

.. seealso:: Functions :func:`fourier_adf`, :func:`fourier_gls`, :func:`fourier_kpss`, :func:`fourier_kss`
