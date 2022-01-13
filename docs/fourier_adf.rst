fourier_ADF
==============================================

Purpose
----------------

Dickey-Fuller unit root test with Flexible Fourier form structural breaks.

Format
----------------
.. function:: { ADFk, k, p, cv } = Fourier_ADF(y, model[, pmax[, fmax[, ic]]])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ====================
          1           Constant
          2           Constant and trend
          =========== ====================

    :type model: Scalar

    :param pmax: Optional, maximum number of lags for :math:`\Delta y`; 0=no lag. Default = 8.
    :type pmax: Scalar

    :param fmax: Optional, maximum number of single Fourier frequency (upper bound is 5). Default = 5.
    :type fmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== =====================
        1           Akaike.
        2           Schwarz.
        3           t-stat significance.
        =========== =====================

    :type ic: Scalar

    :return ADF: ADF(k) statistic.
    :rtype ADF: Scalar

    :return k: Number of single frequency.
    :rtype k: Scalar

    :return p: number of lags selected by chosen information criterion
    :rtype p: Scalar

    :return cv: 1%, 5%, 10% critical values for the chosen model
    :rtype cv: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");


  // With constant
  model = 1;

  // Call test
  { ADFstat, f, p, cv } = Fourier_ADF(y, model);

Source
------

fourier_adf.src

.. seealso:: Functions :func:`coint_egranger`
