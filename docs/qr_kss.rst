
qr_kss
==============================================

Purpose
----------------

Computes the quantile KSS unit root test.

Format
----------------
.. function:: { qr_kss_t, cv } = qr_kss(y, model, tau, [, p, _print])
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

    :param p: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type p: Scalar
        
    :param _print: Optional, print option "true" for printing results. Default = "true".
    :type _print: String
        
    :return qr_kss_t: KSS tau-statistic
    :rtype qr_kss_t: Scalar
        
    :return cv: 1, 5, and 10 percent critical values for KSS tau-stat based on response surfaces.
    :rtype cv: Vector

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
  stat = qr_kss(y, model, tau);

Source
------

qr_kss.src

.. seealso:: Functions :func:`qr_adf`, :func:`qr_fourier_kss`
