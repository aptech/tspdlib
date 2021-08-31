
erspt
==============================================

Purpose
----------------

Computes ERS point optimal unit root test.

Format
----------------
.. function:: { Pt, lrv,  cvPT } = ERSpt(y, model[, bwl, varm])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ======================
          1           Constant.
          2           Constant and trend.
          =========== ======================

    :type model: Scalar

    :param bwl: Optional, bandwidth for the spectral window. Default = round(4 * (T/100)^(2/9)).
    :type  bwl: Scalar

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

    :return Pt: Point statistic
    :rtype Pt: Scalar

    :return lrv: Long-run variance estimate.
    :rtype lrv: Scalar

    :return cvPt: 1, 5, and 10 percent critical values for Pt.
    :rtype cvPt: Vector

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/"ts_examples.csv", "Y");

  //  With constant
  model = 1;

  { Pt, lrv, cvPt } = ERSpt(y, model);

Source
------

gls.src

.. seealso:: Functions :func:`adf`, :func:`kpss`
