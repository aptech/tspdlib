
lm_1break
==============================================

Purpose
----------------

Computes the minimum LM unit root test with one structural break.

Format
----------------
.. function:: { lm_tstat, tb, lags, lambda, cv }  =   LM_1break(y, model, pmax, ic, trimm);


    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ===========================
          1           Break in level.
          2           Break in level and trend.
          =========== ===========================

    :type model: Scalar

    :param pmax: The maximum number of lags for Dy.
    :type pmax: Scalar

    :param ic: The information criterion used for choosing lags.
    =========== ======================
    1           Akaike.
    2           Schwarz.
    3           t-stat significance.
    =========== ======================
    :type ic: Scalar

    :param trimm: Trimming rate.
    :type trimm: Scalar

    :return lm_tstat: Minimum test statistic.
    :rtype lm_tstat: Scalar

    :return tb: Location of break.
    :rtype tb: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return lambda: Break fraction (tb/T).
    :rtype lambda: Scalar

    :return cv: 1, 5, and 10 percent critical values for :func:`lm_1break` tau-stat.
    :rtype cv: Vector

Examples
--------

::

  new;
  cls;
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

  // Trimming rate
  trimm = 0.10;

  /*
  ** 1=Model A: break in level
  ** 2=Model C: break in level and trend
  */
  model = 1;

  "One break LM test (Lee & Strazicich, 2013)";
      { LM_min, tb1, p, lambda, cv } = LM_1break(y, model, pmax, ic, trimm);
      "       LM-stat         ";;LM_min;
      "       Break date      ";;tb1;
      "       Fraction (Î»)    ";;lambda;
      "       Lag             ";;p;
      "       CV (1%, 5%, 10%)";;cv;
      " ";

Source
------

lm_1br.src

.. seealso:: Functions :func:`lm`, :func:`lm_2break`
