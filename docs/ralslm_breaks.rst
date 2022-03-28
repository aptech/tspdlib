
ralslm_breaks
==============================================

Purpose
----------------

Computes the Augmented Dickey Fuller unit root test with 1 or 2 breaks and the RALS technique for non-normal errors.

Format
----------------
.. function:: { LM_min, tb, p, cv_lm, RALS_lm, p2, cv_ralslm } = ralslm_breaks(y, model, nbreaks[, pmax, ic, trimm])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

            =========== ======================================================
            1           Level break (Meng, Im, Lee, & Tieslau (2014))
            2           Level and trend break (Meng, Lee, & Payne (2017))
            =========== ======================================================

    :type model: Scalar

    :nbreaks: Number of breaks (1 or 2).
    :type : Scalar

    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ==============
        1           Akaike.
        1           Schwarz.
        2           t-stat significance.
        =========== ==============

    :type ic: Scalar

    :param trimm: Optional, trimming rate. Default = 0.10.
    :type trimm: Scalar

    :return LM_min: Minimum LM statistic without RALS terms.
    :rtype LM_min: Scalar

    :return tb: Location of estimated breaks.
    :rtype tb: Vector

    :return p: Optimal number of lags selected by determined information criterion.
    :rtype p: Scalar

    :return cv_lm: 1%, 5%, 10% critical values for LM test based on response surfaces.
    :rtype cv_lm: Vector

    :return RALS_lm: LM statistic based on RALS procedure and breaks.
    :rtype RALS_lm: Scalar

    :return rho2: The estimated rho square.
    :rtype rho2: Scalar

    :return cv_ralslm: 1%, 5%, 10% critical values for RALS-LM test basen the estimated rho2.
    :rtype cv_ralslm: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TSe.dat");

  // With constant
  model = 1;
  { LM_min, tb, p, cv_lm, RALS_lm, rho2, cv_ralslm } = RALSLM_breaks(y, model, nbreaks);

Source
------

rals_lm_breaks.src

.. seealso:: Functions :func:`lmkpss`, :func:`lm_1break`, :func:`lm_2break`, :func:`ralslm`
