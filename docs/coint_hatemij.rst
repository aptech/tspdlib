
coint_hatemij
==============================================

Purpose
----------------

Computes the test of the null hypothesis of no cointegration against the alternative of cointegration with two regime shifts.

Format
----------------
.. function:: { ADF_min, TB1adf, TB2adf, Zt_min, TB1zt, TB2zt, Za_min, TB1za, TB2za, cvADFZt, cvZa } = coint_hatemiJ(y, x[, model, bwl, ic, pmax, varm, trimm])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param x: Independent variable.
    :type x: NxK matrix

    :param model: Optional, model to be implemented. Default = 3.

          =========== ====================
          3           Regime shift (C/S)
          =========== ====================

    :type model: Scalar

    :param bwl: Optional, bandwidth length for long-run variance computation. Default = round(4 * (T/100)^(2/9)).
    :type bwl:  Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

         =========== =====================
         1           Akaike.
         2           Schwarz.
         3           t-stat significance
         =========== =====================

    :type ic: Scalar

    :param pmax: Optional, maximum number of lags for :math:`\Delta y` in ADF test. Default = 8.
    :type pmax: Scalar

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.

             =========== ==============
             1           iid.
             2           Bartlett.
             3           Quadratic Spectral (QS).
             4           SPC with Bartlett (Sul, Phillips & Choi, 2005)
             5           SPC with QS
             6           Kurozumi with Bartlett
             7           Kurozumi with QS
             =========== ==============

    :type varm: Scalar

    :param trimm: Optional, trimming rate. Default = 0.10.
    :type trimm: Scalar

    :return ADFmin: ADF test statistic
    :rtype ADFmin: Scalar

    :return TB1adf: First break point using ADF statistic.
    :rtype TB1adf: Scalar

    :return TB2adf: Second break point using ADF statistic.
    :rtype TB2adf: Scalar

    :return Ztmin: Zt test statistic
    :rtype Ztmin: Scalar

    :return TB1zt: Break point using Zt statistic.
    :rtype TB1zt: Scalar

    :return TB2zt: Break point using Zt statistic.
    :rtype TB2zt: Scalar

    :return Zamin: Za test statistic
    :rtype Zamin: Scalar

    :return TB1za: First break point for using Za statistic.
    :rtype TB1za: Scalar

    :return TB2adf: Second break point using Za statistic.
    :rtype TB2adf: Scalar

    :return cvADFZt: 1%, 5%, 10% critical values for ADF and Zt test statistics.
    :rtype cvADFZt: Scalar

    :return cvZa:  1%, 5%, 10% critical values for Za test statistics.
    :rtype cvZa: Scalar


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

  T = rows(data);

  // Call test
  {ADF_min, TB1adf, TB2adf, Zt_min, TB1zt, TB2zt, Za_min, TB1za, TB2za, cvADFZt, cvZa } =
      coint_hatemiJ(y, x);


Source
------

coint_hatemij.src

.. seealso:: Functions :func:`coint_cissanso`, :func:`coint_egranger`, :func:`coint_ghansen`, :func:`coint_maki`
