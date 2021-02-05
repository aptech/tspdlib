
adf
==============================================

Purpose
----------------

Computes the DF-GLS unit root test.

Format
----------------
.. function:: { GLStau, lags, cvGLS }   = dfgls(y, model, pmax, ic);


    :param y: Time series data to be test.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

          =========== ======================
          1           Constant.
          2           Constant and trend.
          =========== ======================

    :type model: Scalar

    :param pmax: Optional, the maximum number of lags for Dy. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

             =========== =======================
             1           Akaike.
             1           Schwarz.
             2           t-stat significance.
             =========== ========================

    :type ic: Scalar

    :return GLStau: Dickey Fuller GLS test statistic.
    :rtype GLStau: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return cv: 1, 5, and 10 percent critical values for GLS tau statistic.
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
  ** 0 = no lags
  */
  pmax = 12;

  /*
  ** Information Criterion:
  ** 1=Akaike;
  ** 2=Schwarz;
  ** 3=t-stat sign.
  */
  ic = 3;

  format /m1 /rd 8,4;

  /*
  ** With constant
  */
  model = 1;

  { GLStau, GLSp, cvGLS } = DFGLS(y, model, pmax, ic);

  "ERS tests      ";
  "Test      Stat.   cv(1%)   cv(5%)   cv(10%)   Lag  ";
  "--------------------------------------------------";
  "DFGLS " ;; GLStau ;; cvGLS ;; GLSP ;

Source
------

gls.src

.. seealso:: Functions :func:`adf`, :func:`kpss`
