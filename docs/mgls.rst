
mgls
==============================================

Purpose
----------------

Performs the MGLS unit root test.

Format
----------------
.. function::  { MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT } = MGLS(y, model, bwl, varm);


    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ======================
          1           Constant.
          2           Constant and trend.
          =========== ======================

    :type model: Scalar

    :param bwl: Bandwidth for the spectral window.
    :type  bwl: Scalar

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
  y = loadd(__FILE_DIR $+ "TSe.dat");
  T = rows(y);

  // bandwidth lag
  bwl = round(4 * (T/100)^(2/9));

  // Set model type
  // 1 = Constant
  // 2 = Constant and trend
  model = 1;

  // Set long-run variance computation type
  // 1           iid.
  // 2           Bartlett.
  // 3           Quadratic Spectral (QS).
  // 4           SPC with Bartlett /see (Sul, Phillips & Choi, 2005)
  // 5           SPC with QS
  // 6           Kurozumi with Bartlett
  // 7           Kurozumi with QS
  varm = 1;

  { MZa, MZt, MSB, MPT, cvMZA, cvMZt, cvMSB, cvMPT } = MGLS(y, model, bwl, varm);

    "Test      Stat.   cv(1%)   cv(5%)   cv(10%)   Lag  ";
    "--------------------------------------------------";
    "MZa   " ;; MZa    ;; cvMZA;
    "MZt   " ;; MZt    ;; cvMZt;
    "MSB   " ;; MSB    ;; cvMSB;
    "MPT   " ;; MPT    ;; cvMPT;

Source
------

gls.src

.. seealso:: Functions :func:`adf`, :func:`kpss`, :func:`gls`, :func:`dfgls`, :func:`erspt`
