coint_egranger
==============================================

Purpose
----------------

Engle-Granger cointegration test.

Format
----------------
.. function:: { tau, cvADF } = coint_egranger(y, x, model, pmax, ic)


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

    :param pmax: Maximum number of lags for Dy in ADF test.
    :rtype pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

         =========== ==============
         1           Akaike.
         1           Schwarz.
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

  // Load the data
  data = loadd(__FILE_DIR $+ "TScoint.dat");

  // Define y and x matrix
  y = data[., 1];
  x = data[., 2:cols(data)];

  /*
  ** Information Criterion:
  ** 1=Akaike;
  ** 2=Schwarz;
  ** 3=t-stat sign.
  */
  ic = 2;

  // Maximum number of lags
  pmax = 12;

  // No constant or trend
  model = 0;
  { tau, cvADF } = coint_egranger(y, x, model, pmax, ic);


Source
------

coint_egranger.src

.. seealso::
