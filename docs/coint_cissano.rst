coint_cissano
==============================================

Purpose
----------------

Computes a LM-type statistic to test the null hypothesis of cointegration allowing for the possibility of a structural break.

Format
----------------
.. function:: { SCols, TBols, SCdols, TBdols, lambda, cv } = coint_cissanso(y, x, model [, bwl, varm, trimm, q])
    :noindexentry:

    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param x: Independent variable.
    :type x: NxK matrix

    :param model: Model to be implemented.

          =========== ==============
          1           Model An: Level shift.
          2           Model A:  Level shift with trend.
          3           Model D:  Regime shift.
          4           Model E:  Regime and trend shift.
          =========== ==============

    :type model: Scalar

    :param bwl: Optional, bandwidth length for long-run variance computation. Default = round(4 * (T/100)^(2/9)).
    :type bwl: Scalar

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

    :param q: Optional, number of leads and lags for DOLS estimation. Default = int(4 * (t/100)^(2/9)).
    :type q: Scalar

    :return SCols: SC test based on OLS estimation
    :rtype SCols: Scalar

    :return TBols: Break location based on OLS estimation.
    :rtype TBols: Scalar

    :return SDols: SC test based on DOLS estimation
    :rtype SDols: Scalar

    :return TBDols: Break location based on DOLS estimation.
    :rtype TBDols: Scalar

    :return lamdba: Fraction of break (TB/T)
    :rtype lambda: Scalar

    :return cv: 1%, 5%, 10% critical values for the chosen model
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

  // Level shifts
  model = 1;

  // Call test
  { SCols, TBols, SCdols, TBdols, lambda, cv } = coint_cissanso(y, x, model);


Source
------

coint_cissano.src

.. seealso:: Functions :func:`coint_egranger`, :func:`coint_ghansen`, :func:`coint_hatemij`, :func:`coint_maki`
