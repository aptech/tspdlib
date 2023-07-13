coint_egranger
==============================================

Purpose
----------------

Computes the Engle-Granger test of the null hypothesis of no cointegration against the alternative of cointegration.

Format
----------------
.. function:: { tau, cvADF } = coint_egranger(y, x, model[, pmax, ic])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param x: Independent variable.
    :type x: NxK matrix

    :param model: Model to be implemented.

          =========== ============================
          0           No deterministic components.
          1           Constant only.
          2           Constant and trend.
          =========== ============================

    :type model: Scalar

    :param pmax: Optional, maximum number of lags for :math:`\Delta y` in ADF test. Default = 8.
    :rtype pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 2.

         =========== ==============
         1           Akaike.
         2           Schwarz.
         =========== ==============

    :type ic: Scalar

    :return tau: Engle & Granger (1987) ADF test.
    :rtype tau: Scalar

    :return cv:  1%, 5%, 10% critical values for chosen model.
    :rtype cv: Vector

Examples
--------

::

  library tspdlib;

  // Load dataset
  data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv",
                                   ". + date($Date, '%b-%y')");

  // Define y and x matrix
  y = data[., 1];
  x = data[., 2:cols(data)];

  // No constant or trend
  model = 0;

  // Call test
  { tau, cvADF } = coint_egranger(y, x, model);


Source
------

coint_egranger.src

.. seealso:: Functions :func:`coint_cissanso`, :func:`coint_ghansen`, :func:`coint_hatemij`, :func:`coint_maki`
