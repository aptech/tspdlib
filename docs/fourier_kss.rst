fourier_kss
==============================================

Purpose
----------------

KSS unit root test with flexible Fourier form structural breaks.

Format
----------------
.. function:: { Ftau, p, k } = Fourier_kss(y, model, test [, pmax, fmax, ic])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ====================
          1           Constant
          2           Constant and trend
          =========== ====================

    :type model: Scalar

    :param test: Test to be conducted. Options are "FADF" or "FKSS".
    :type test: String
    
    :param pmax: Optional, maximum number of lags for :math:`\Delta y`; 0=no lag. Default = 8.
    :type pmax: Scalar

    :param fmax: Optional, maximum number of single Fourier frequency (upper bound is 5). Default = 5.
    :type fmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== =====================
        1           Akaike.
        2           Schwarz.
        3           t-stat significance.
        =========== =====================

    :type ic: Scalar

    :return Ftau: F-tau statistic,
    :rtype Ftau: Scalar

    :return p: number of lags selected by chosen information criterion
    :rtype p: Scalar
    
    :return k: Chosen number of single frequency.
    :rtype k: Scalar

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");


  // With constant
  model = 1;

  // Call test
  { Ftau, p, k, cv } = Fourier_KSS(y, model, "FKSS");

Source
------

fourier_kss.src

.. seealso:: Functions :func:`fourier_adf`, :func:`fourier_gls`, :func:`fourier_kpss`, :func:`fourier_lm`   
