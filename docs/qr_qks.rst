
qks_tests
==============================================

Purpose
----------------

Computes the quantile Kolmogorovâ-Smirnov (QKS) tests.

Format
----------------
.. function:: QKS = qks_tests(y, model, test, [, p, f])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

        =========== ====================
        1           Constant.
        2           Constant and trend.
        =========== ====================

    :type model: Scalar

    :param p: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type p: Scalar

    :param f: Optional, the Fourier frequency. Default = 3.
    :type f: Scalar

    :return qks: QKS tau-statistic
    :rtype qks: Scalar


Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

  // Use constant, no trend model
  model = 1;

  /*
  ** QKS test of Koenker & Xiao (2004)
  */
  test = 1;
  qks_stat = qks_tests(y, model, test); 

Source
------

qr_qks.src

.. seealso:: Functions :func:`qr_adf`, :func:`qr_kss`, :func:`qr_fourier_adf`, :func:`qr_fourier_kss`
