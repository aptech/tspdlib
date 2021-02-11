
coint_tsongetal
==============================================

Purpose
----------------

Test of the null of cointegration allowing for structural breaks of unknown form in deterministic trend by using the Fourier form.

Format
----------------
.. function:: {CIfols, FFols, CIfdols, FFdols, cv, Fols, Fdols} =  coint_tsongetal(y, x, model[, bwl, kmax, varm, q]);


    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param x: Independent variable.
    :type x: NxK matrix

    :param model: Model to be implemented.

          =========== ========================================
          1           Level shift model with Fourier
          2           Level & trend shift model with Fourier
          =========== ========================================

    :type model: Scalar

    :param bwl: Optional, bandwidth length for long-run variance computation. Default = round(4 * (T/100)^(2/9)).
    :type bwl:  Scalar

    :param kmax: Optional, maximum number of Fourier frequency. Default = 5.
    :type kmax: Scalar

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

    :param q: Optional, number of leads and lags for DOLS estimation. Default = int(4 * (t/100)^(2/9)).
    :type q: Scalar

    :return CIols: CI test based on OLS estimation.
    :rtype CIols:  Scalar

    :return FFols: Optimal Fourier frequency based on OLS estimation.
    :rtype FFols:  Scalar

    :return CIDols: CI test based on DOLS estimation
    :rtype CIDols:  Scalar

    :return FFdols: Optimal Fourier frequency based on DOLS estimation.
    :rtype FFdols:  Scalar

    :return Fols: F-stat for Fourier terms significance based on OLS.
    :rtype Fols:  Scalar

    :return Fdols: F-stat for Fourier terms significance based on DOLS.
    :rtype Fdols:  Scalar

    :return cv: 1%, 5%, 10% critical values for the model chosen.
    :rtype cv: Scalar


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

  // Level shift
  model = 1;
  { CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
                      coint_tsongetal(y, x, model);

Source
------

coint_tsongetal.src
