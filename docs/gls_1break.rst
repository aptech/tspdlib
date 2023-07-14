
gls_1break
==============================================

Purpose
----------------

Computes the GLS unit root test with one structural break.

Format
----------------
.. function:: { ADFGLS_min, p, PT_min, MZa_min, MZt_min, MSB_min, MPT_min, s2, tb1_min, lambda, cvPT, cvMPT, cvMZt, cvDFGLS, cvMSB, cvMZa } = gls_1break(y, model [, pmax, ic])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ===========================
          0           Level shift.
          1           Trend shift.
          2           Level and trend shift.
          =========== ===========================

    :type model: Scalar

    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

       =========== ======================
       1           Akaike.
       2           Schwarz.
       3           t-stat significance.
       =========== ======================

    :type ic: Scalar

    :return GLStau: ADF-GLS statistic.
    :rtype GLStau: Scalar

    :return p: Number of lags for ADF-GLS statistic.
    :rtype p: Scalar

    :return PT: PT statistic.
    :rtype PT: Scalar

    :return Mza: MZalpha statistic.
    :rtype Mza: Scalar

    :return Mzt: MZt statistic.
    :rtype Mzt: Scalar
    
    :return MSB: MSB statistic.
    :rtype MSB: Scalar
    
    :return MPT: MPT statistic.
    :rtype MPT: Scalar
    
    :return s2: Long-run variance based on autoregressive spectral estimate.
    :rtype s3: Scalar
    
    :return tb: Location of the break.
    :rtype tb: Scalar
    
    :return lambda: Fraction of break (tb/T)
    :rtype lambda: Scalar
    
    :return cvPT: 1%, 5%, and 10% critical values for the PT statistic.
    :rtype cvPT: Vector

    :return cvMza: 1%, 5%, and 10% critical values for the MZalpha statistic.
    :rtype cvMza: Vector

    :return cvMzt: 1%, 5%, and 10% critical values for the MZt statistic.
    :rtype cvMzt: Vector
    
    :return cvMSB: 1%, 5%, and 10% critical values for the MSB statistic.
    :rtype cvMSB: Vector
    
    :return cvMPT: 1%, 5%, and 10% critical values for the MPT statistic.
    :rtype cvMPT: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", 
                             "Y + date($Date, '%b-%y')");

  // Break in level
  model = 1;
  { LM_min, tb1, p, lambda, cv } = gls_1break(y, model);

  // Break in level and trend
  model = 2;
  { LM_min, tb1, p, lambda, cv } = gls_1break(y, model);

Source
------

gls_1br.src

.. seealso:: Functions :func:`gls_2breaks`
