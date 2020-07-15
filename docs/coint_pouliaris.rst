
coint_pouliaris
==============================================

Purpose
----------------

Asymptotic critical values for residual based tests for cointegration.

Format
----------------
.. function:: { Zt, Za, cvZt, cvZa }  = coint_pouliaris(y, x, model, bwl, varm)


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

    :param bwl: Bandwidth length for long-run variance computation.
    :type bwl:  Scalar

    :param varm: Long-run consistent variance estimation method

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

  // Load the data
  data = loadd(__FILE_DIR $+ "TScoint.dat");

  // Define y and x matrix
  y = data[., 1];
  x = data[., 2:cols(data)];

  // Time variable
  T = rows(data);

  // Long-run consistent variance estimation method
  varm = 3;

  // Bandwidth for kernel estimator
  bwl = round(4 * (T/100)^(2/9));

  // No constant or trend
  model = 0;

      { Zt, Za, cvZt, cvZa } = coint_pouliaris(y, x, model, bwl, varm);

      "    Test         Statistic  CV(1%, 5%, 10%)";
      "Ho: no co-integration (EG, 1987 & P0, 1990)";
      "   PO_Zt         ";;Zt    ;; cvZt';
      "   PO_Za         ";;Za    ;; cvZa';
      "";


Source
------

coint_pouliaris.src
