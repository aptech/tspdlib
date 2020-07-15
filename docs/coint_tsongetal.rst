
coint_tsongetal
==============================================

Purpose
----------------

Test of the null of cointegration allowing for structural breaks of unknown form in deterministic trend by using the Fourier form.

Format
----------------
.. function:: {CIfols, FFols, CIfdols, FFdols, cv, Fols, Fdols} =  coint_tsongetal(y, x, model, bwl, kmax, varm, q);


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

    :param bwl: Bandwidth length for long-run variance computation.
    :type bwl:  Scalar

    :param kmax: Maximum number of Fourier frequency
    :type kmax: Scalar

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

    :param q: Number of leads and lags for DOLS estimation.
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

  // Load the dataset
  data = loadd(__FILE_DIR $+ "TScoint.dat");

  // Define y and x matrix
  y = data[., 1];
  x = data[., 2:cols(data)];

  T = rows(data);

  // Long-run consistent variance estimation method
  varm = 3;

  // Bandwidth for kernel estimator
  bwl = round(4 * (T/100)^(2/9));

  // Leads & Lags for DOLS estimation
  q = int(4*(t/100)^(2/9));

  // Maximum number of Fourier frequency
  kmax = 3;

  format/m1/rd 8,3;

  // Level shift
  model = 1;
  { CIfols, FFols, CIfdols, FFdols, cv_fourier, Fols, Fdols } =
                      coint_tsongetal(y, x, model, bwl, kmax, varm, q);
      "Ho: co-integration   (Tsong et al., 2016)";
      "   Fourier CIols ";; CIfols;;  cv_fourier';
      "   Freq. (Fols)  ";; FFols;
      "   F-stat (Fols) ";; Fols[FFols];
      "   Fourier CIdols";; CIfdols;;cv_fourier';
      "   Freq. (Fdols) ";; FFdols;
      "   F-stat(Fdols) ";; Fdols[FFdols];
      "";

Source
------

coint_tsongetal.src
