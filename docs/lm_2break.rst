
lm_1break
==============================================

Purpose
----------------

Computes the minimum LM unit root test with one structural break.

Format
----------------
.. function:: { lm_tstat, tb1, tb2, lags, cv }  =   LM_2break(y, model, pmax, ic, trimm);


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

    :return lm_tstat: Minimum test statistic with two breaks.
    :rtype lm_tstat: Scalar

    :return tb1: Location of first break.
    :rtype tb1: Scalar

    :return tb1: Location of second break.
    :rtype tb1: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

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

  "Two breaks LM test (Lee & Strazicich, 2003)";
    { LM_min, tb1, tb2, p, cv } = LM_2breaks(y, model, pmax, ic, trimm);
    "       LM-stat         ";;LM_min;
    "       Break dates     ";;tb1~tb2;
    "       Fraction        ";;tb1/rows(y)~tb2/rows(y);
    "       Lag             ";;p;
    "       CV (1%, 5%, 10%)";;cv;
    "";
      " ";

Source
------

lm_1br.src

.. seealso:: Functions :func:`lm`, :func:`lm_1break`
