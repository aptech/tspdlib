
ralslm
==============================================

Purpose
----------------

Computes the Augmented Dickey Fuller unit root test with the RALS technique for non-normal errors.

Format
----------------
.. function:: { rals_tau, rho2, cv } = ralslm(y, [, pmax, ic])
    :noindexentry:

    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ==============
        1           Akaike.
        1           Schwarz.
        2           t-stat significance.
        =========== ==============

    :type ic: Scalar

    :return rals_tau: The tau statistic based on RALS procedure and LM test.
    :rtype rals_tau: Scalar

    :return rho2: The estimated rho square.
    :rtype rho2: Scalar

    :return cv: 1, 5, and 10 percent critical values for the estimated rho2
    :rtype cv: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"TSe.dat");

  // With constant
  model = 1;
  { rals_tau, rho2, cv } = RALSLM(y, model);

Source
------

rals_lm.src

.. seealso:: Functions :func:`lm`,:func:`lm_1break`, :func:`lm_2break`
