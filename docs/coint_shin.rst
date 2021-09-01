coint_shin
==============================================

Purpose
----------------

A residual-based test for the null of cointegration using a structural single equation model.

Format
----------------
.. function:: { CIols, CIdols, cv } = coint_shin(y, x, model[, bwl, varm, q])
    :noindexentry:

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

    :param bwl: Optional, bandwidth length for long-run variance computation. Default = round(4 * (T/100)^(2/9)).
    :type bwl:  Scalar

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.

             =========== =====================================================
             1           iid.
             2           Bartlett.
             3           Quadratic Spectral (QS).
             4           SPC with Bartlett (Sul, Phillips & Choi, 2005)
             5           SPC with QS
             6           Kurozumi with Bartlett
             7           Kurozumi with QS
             =========== =====================================================

    :type varm: Scalar

    :param q: Optional, number of leads and lags for DOLS estimation. Default = int(4 * (t/100)^(2/9)).
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

  // Load dataset
  data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_coint.csv",
                            "Y1 + Y2 + Y3 + Y4 + date($Date, '%b-%y')");


  // Define y and x matrix
  y = data[., 1];
  x = data[., 2:cols(data)];

  // No constant
  model = 0;
  { CIols, CIdols, cv} = coint_shin(y, x, model);

  // Constant only
  model = 1;
  { CIols, CIdols, cv} = coint_shin(y, x, model);


Source
------

coint_shin.src
