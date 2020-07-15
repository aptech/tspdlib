coint_shin
==============================================

Purpose
----------------

A residual-based test for the null of cointegration using a structural single equation model.
Format
----------------
.. function:: { CIols, CIdols, cv }  = coint_shin(y, x, model, bwl, varm, q)


    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param x: Independent variable.
    :type x: NxK matrix

    :param model: Model to be implemented.

          =========== ======================
          0           None
          1           Constant only
          2           Constant and trend
          =========== ======================

    :type model: Scalar

    :param bwl: Bandwidth length for long-run variance computation.
    :type bwl:  Scalar

    :param varm: Long-run consistent variance estimation method

             =========== =====================================================
             1           iid.
             2           Bartlett.
             3           Quadratic Spectral (QS).
             4           SPC with Bartlett /see (Sul, Phillips & Choi, 2005)
             5           SPC with QS
             6           Kurozumi with Bartlett
             7           Kurozumi with QS
             =========== =====================================================

    :type varm: Scalar

    :param q: Number of leads and lags for DOLS estimation.
    :type q: Scalar

    :return CIols: CI test based on OLS estimation
    :rtype CIols:  Scalar

    :return CIDols: CI  test based on DOLS estimation
    :rtype CIDols:  Scalar

    :return cv: 1%, 5%, 10% critical values for the model chosen.
    :rtype cv: Scalar


Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load data
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

  // Leads & Lags for DOLS estimation
  q = int(4*(t/100)^(2/9));

  // No constant
  model = 0;
     { CIols, CIdols, cv} = coint_shin(y, x, model, bwl, varm, q);

      "    Test         Statistic  CV(1%, 5%, 10%)";
      "Ho: co-integration   (Shin, 1994)";
      "   CIols         ";;CIols ;; cv';
      "   CIdols        ";;CIdols;; cv';
      "";

  // Constant only
  model = 1;
     { CIols, CIdols, cv} = coint_shin(y, x, model, bwl, varm, q);

      "    Test         Statistic  CV(1%, 5%, 10%)";
      "Ho: co-integration   (Shin, 1994)";
      "   CIols         ";;CIols ;; cv';
      "   CIdols        ";;CIdols;; cv';
      "";



Source
------

coint_shin.src
