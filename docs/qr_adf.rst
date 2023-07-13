
qr_adf
==============================================

Purpose
----------------

Computes the quantile Augmented Dickey-Fuller unit root test.

Format
----------------
.. function:: { qr_tstat, lags, cv } = qr_ADF(y, model, tau, [, pmax, ic])
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

    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ====================
        1           Akaike.
        1           Schwarz.
        2           t-stat significance.
        =========== ====================

    :type ic: Scalar

    :return qr_tstat: Quantile, Dickey-Fuller test statistic.
    :rtype qr_tstat: Scalar

    :return p: Chosen number of lags.
    :rtype p: Scalar
        
    :return cv: 1%, 5%, 10% critical values given the estimated delta2
    :rtype cv: Vector
        
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
  { stat1, p1, cv1 } = qr_ADF(y, model, tau);

Source
------

qr_adf.src

.. seealso:: Functions :func:`adf`, :func:`adf_1break`, :func:`adf_2breaks`, :func:`qr_kss`, :func:`qr_fourier_adf`
