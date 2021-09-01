coint_egranger
==============================================

Purpose
----------------

Engle-Granger cointegration test.

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

    :return cv: 1, 5, and 10 percent critical values for chosen model.
    :rtype cv: Vector

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load dataset
  data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_coint.csv",
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");

  // Define y and x matrix
  y = data[., 1];
  x = data[., 2:cols(data)];

  // No constant or trend
  model = 0;
  { tau, cvADF } = coint_egranger(y, x, model);


Source
------

coint_egranger.src

.. seealso::
