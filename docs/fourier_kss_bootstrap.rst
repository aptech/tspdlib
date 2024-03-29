fourier_kss_bootstrap
==============================================

Purpose
----------------

Computes the KSS unit root test with flexible Fourier form structural breaks.

Format
----------------
.. function:: { test_boot, cv_boot } = Fourier_kss_bootstrap(y, model, test [, pmax, fmax, ic])
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

    :param Nboot: Optional, number of bootstrap iterations. Default = 1000.
    :type Scalar:
        
    :return test_boot: Bootstrapped test statistic.
    :rtype test_boot: Scalar

    :return cv_boot: Bootstrapped 1%, 5%, and 10% critical values.
    :rtype cv_boot: Scalar
    
    :return f: Chosen number of single frequency.
    :rtype f: Scalar

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", 
                                "Y + date($Date, '%b-%y')");

  // With constant
  model = 1;

  // Call test
  { test_boot, cv_boot } = Fourier_KSS_bootstrap(y, model);

Source
------

fourier_kss.src

.. seealso:: Functions :func:`fourier_kss`, :func:`fourier_adf`, :func:`fourier_gls`, :func:`fourier_kpss`, :func:`fourier_lm`   
