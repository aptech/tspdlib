
lm
==============================================

Purpose
----------------

Computes the LM tests for a unit root in the presence of deterministic trends.

Format
----------------
.. function:: { LM_tstat, p, cv } = LM(y, pmax, ic);


    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param pmax: Optional, the maximum number of lags for Dy. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

             =========== ==============
             1           Akaike.
             1           Schwarz.
             2           t-stat significance.
             =========== ==============

    :type ic: Scalar

    :return LM_tstat: LM tau-statistic.
    :rtype LM_tstat: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return LM_cv: 1, 5, and 10 percent critical values for ADF tau-stat.
    :rtype LM_cv: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "TSe.dat");

  /*
  ** Maximum number of lags for ds;
  ** 0=no lags
  */
  pmax = 12;

  /*
  ** Information Criterion:
  ** 1=Akaike;
  ** 2=Schwarz;
  ** 3=t-stat sign.
  */
  ic = 3;

  { lm_tau, lm_p, lm_cv }  = lm(y, pmax, ic);

  "LM unit root test    ";; lm_tau ;; lm_cv ;; lm_p ;


Source
------

lm.src

.. seealso:: Functions :func:`lm_1break`, :func:`lm_2break`
