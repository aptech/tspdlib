
mgls
==============================================

Purpose
----------------

Performs the MGLS unit root test.

Format
----------------
.. function::  { MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT } = MGLS(y, model[, bwl, varm])
    :noindexentry:

    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

        =========== ======================
        1           Constant.
        2           Constant and trend.
        =========== ======================

    :type model: Scalar

    :param bwl: Optional, bandwidth for the spectral window. Default = round(4 * (T/100)^(2/9)).
    :type  bwl: Scalar

    :param varm:  Optional, long-run consistent variance estimation method. Default = 1.

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

    :return MZa: MZalpha test statistic.
    :rtype MZa: Scalar

    :return MZt: MZt test statistic.
    :rtype MZt: Scalar

    :return MSB: MSB test statistic.
    :rtype MSB: Scalar

    :return MPT: MPT test statistic.
    :rtype MZt: Scalar

    :return cvMZa: 1, 5, and 10 percent critical values for MZa.
    :rtype cvMZa: Scalar

    :return cvMZt: 1, 5, and 10 percent critical values for MZt.
    :rtype cvMZt: Vector

    :return cvMSB: 1, 5, and 10 percent critical values for MSB.
    :rtype cvMSB: Vector

    :return cvMPT: 1, 5, and 10 percent critical values for MPT.
    :rtype cvMPT: Vector

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_examples.csv", "Y + date($Date, '%b-%y')");

  // With constant
  model = 1;
  {MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model);

  // With constant and trend
  model = 2;
  {MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT} = MGLS(y, model);

Source
------

gls.src

.. seealso:: Functions :func:`adf`, :func:`lmkpss`, :func:`dfgls`, :func:`erspt`
