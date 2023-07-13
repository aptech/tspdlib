
qr_fourier_adf
==============================================

Purpose
----------------

Computes the quantile Augmented Dickey-Fuller unit root test with flexible Fourier form structural breaks.

Format
----------------
.. function:: qr_f_adf  = QR_Fourier_ADF(y, model, tau [, p, k, _print])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

        =========== ====================
        1           Constant.
        2           Constant and trend.
        =========== ====================

    :type model: Scalar

    :param tau: The quantile (0.1,...,1)
    :type tau: Scalar

    :param p: Optional, the number of lags used for :math:`\Delta y`. Default = 8.
    :type p: Scalar

    :param k: Optional, the Fourier frequency. Default = 3.
    :type k: Scalar

    :param _print: Optional, print option "true" for printing results. Default = "true".
    :type _print: String
        
    :return qr_f_adf: Quantile, Fourier ADF test statistic.
    :rtype qr_f_adf: Scalar

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

  // Run model with constant
  model = 1;

  // Test for 70% percentile
  tau = 0.7;

  // Run test
  qr_adf_stat = QR_Fourier_ADF(y, model, 0.7);

Source
------

qr_fourier_adf.src

.. seealso:: Functions :func:`quantileADF`, :func:`adf`, :func:`adf_1break`, :func:`adf_2breaks`
