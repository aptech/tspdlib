
qr_fourier_kss
==============================================

Purpose
----------------

Computes the quantile KSS unit root test with flexible Fourier form structural breaks.

Format
----------------
.. function:: qr_f_kss  = qr_fourier_kss(y, model, tau [, p, f, _print])
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

    :param _print: Optional, print option "true" for printing results. Default = "true".
    :type _print: String
        
    :return qr_f_kss: Quantile, Fourier KSS test statistic.
    :rtype qr_f_kss: Scalar

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
  qr_adf_stat = qr_fourier_kss(y, model, 0.7);

Source
------

qr_fourier_kss.src

.. seealso:: Functions :func:`qr_KSS`, :func:`qr_fourier_adf`
