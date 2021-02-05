
lmkpss
==============================================

Purpose
----------------

Performs the Kwiatkowski, Phillips, Schmidt, and Shin (KPSS) stationarity test.

Format
----------------
.. function::  { kpss, cv } = LMkpss(y, model[, bwl, varm]);


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

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.

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

    :return kpss: The KPSS test statistic.
    :rtype kpss: Scalar

    :return cvKPSS: 1, 5, and 10 percent critical values for the KPSS test statistic.
    :rtype cvKPSS: Scalar

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "TSe.dat");

  // Constant
  model = 1;
  { kpss, cvKPSS } = lmkpss(y, model);

  // Constant and trend
  model = 2;
  { kpss, cvKPSS } = lmkpss(y, model);


Source
------

kpss.src

.. seealso:: Functions :func:`adf`, :func:`kpss`, :func:`gls`, :func:`dfgls`, :func:`erspt`
