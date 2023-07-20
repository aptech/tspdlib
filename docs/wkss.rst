
kss
==============================================

Purpose
----------------

Computes the WKSS unit root test.

Format
----------------
.. function:: { wkss_t, p } = wkss(y, model [, pmax, ic])
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

    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ====================
        1           Akaike.
        2           Schwarz.
        3           t-stat significance.
        =========== ====================

    :type ic: Scalar
        
    :return wkss_t: wKSS tau-statistic
    :rtype wkss_t: Scalar
        
    :return p: Chosen number of lags.
    :rtype p: Scalar


Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

  // Run model with constant
  model = 1;

  // Run test
  stat = wkss(y, model);

Source
------

wkss.src

.. seealso:: Functions :func:`adf`, :func:`kss` :func:`qr_fourier_kss`
