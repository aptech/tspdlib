
kss
==============================================

Purpose
----------------

Computes the KSS unit root test.

Format
----------------
.. function:: { kss_t, p, cv } = kss(y, model, tau, [, p, _print])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

        =========== ====================
        0           Zero mean & no trend
        1           Constant included.
        2           Constant and trend.
        =========== ====================

    :type model: Scalar

    :param p: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type p: Scalar
        
    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ====================
        1           Akaike.
        2           Schwarz.
        3           t-stat significance.
        =========== ====================

    :type ic: Scalar
        
    :return kss_t: KSS tau-statistic
    :rtype kss_t: Scalar
        
    :return p: Chosen number of lags.
    :rtype p: Scalar
     
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

  // Run test
  stat = kss(y, model);

Source
------

kss.src

.. seealso:: Functions :func:`adf`, :func:`kss` :func:`qr_fourier_kss`
