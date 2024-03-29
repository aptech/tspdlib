
qr_fourier_adf_bootstrap
==============================================

Purpose
----------------

Computes bootstrap critical values for the quantile Augmented Dickey-Fuller unit root test with flexible Fourier form structural breaks.

Format
----------------
.. function:: { test_boot, cv_boot }  = qr_fourier_adf_bootstrap(y, model, tau [, p, f, _Nboot])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

        =========== ====================
        1           Constant.
        2           Constant and trend.
        =========== ====================

    :type model: Scalar

    :param tau: The quantile (:math:`0 \lt  \tau \lt 1`).
    :type tau: Scalar

    :param p: Optional, the number of lags used for :math:`\Delta y`. Default = 8.
    :type p: Scalar

    :param f: Optional, the Fourier frequency. Default = 3.
    :type f: Scalar

    :param _Nboot: Optional, number of iterations. Default = 1000.
    :type _NBoot: Scalar
        
    :return test_boot:  Bootstrapped ADF test statistic with smooth structural change for the given quantile.
    :rtype test_boot: Vector
        
    :return cv_boot:  1, 5, and 10 percent bootstrap critical values for the ADF test statistic with smooth structural change.
    :rtype cv_boot: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

  // Run model with constant
  model = 1;

  // Test for 70% percentile
  tau = 0.7;

  // Run test
  { tn_boot, cv } = QR_Fourier_ADF_bootstrap(y, model, 0.7);

Source
------

qr_fourier_adf.src

.. seealso:: Functions :func:`qr_ADF`, :func:`qr_fourier_adf`, :func:`adf_1break`, :func:`adf_2breaks`
