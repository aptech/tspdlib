
coint_pouliaris
==============================================

Purpose
----------------

Asymptotic critical values for residual based tests for cointegration.

Format
----------------
.. function:: { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model[, bwl, varm])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param x: Independent variable.
    :type x: NxK matrix

    :param model: Model to be implemented.

          =========== ====================
          0           None
          1           Constant only
          2           Constant and trend
          =========== ====================

    :type model: Scalar

    :param bwl: Optional, bandwidth length for long-run variance computation. Default = round(4 * (T/100)^(2/9)).
    :type bwl:  Scalar

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.

             =========== ======================================================
             1           iid.
             2           Bartlett.
             3           Quadratic Spectral (QS).
             4           SPC with Bartlett /see (Sul, Phillips & Choi, 2005)
             5           SPC with QS
             6           Kurozumi with Bartlett
             7           Kurozumi with QS
             =========== ======================================================

    :type varm: Scalar

    :return Zt: Phillips & Ouliaris (1989) Zt test
    :rtype Zt:  Scalar

    :return Za: Phillips & Ouliaris (1989) Za test
    :rtype Za:  Scalar

    :return cvZt: 1%, 5%, 10% critical values for ADF and Zt test statistics.
    :rtype cvZt: Scalar

    :return cvZa:  1%, 5%, 10% critical values for Za test statistics.
    :rtype cvZa: Scalar


Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load dataset
  data = loadd(__FILE_DIR $+ "ts_coint.csv", 
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");


  // Define y and x matrix
  y = data[., 1];
  x = data[., 2:cols(data)];

  // No constant or trend
  model = 0;

  { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model);



Source
------

coint_pouliaris.src
