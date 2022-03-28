
dfgls
============

Purpose
----------------

Computes the DF-GLS unit root test.

Format
----------------
.. function:: { GLStau, lags, cvGLS } = dfgls(y, model[, pmax, ic])
    :noindexentry:

    :param y: Time series data to be tested.
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

             =========== ========================
             1           Akaike.
             1           Schwarz.
             2           t-stat significance.
             =========== ========================

    :type ic: Scalar

    :return GLStau: Dickey Fuller GLS test statistic.
    :rtype GLStau: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return cv: 1%, 5%, and 10% critical values for GLS tau statistic.
    :rtype cv: Vector

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y");

  // With constant
  model = 1;
  { GLStau, GLSp, cvGLS } = DFGLS(y, model);

  // With constant and trend
  model = 2;
  { GLStau, GLSp, cvGLS } = DFGLS(y, model);

Source
------

gls.src

.. seealso:: Functions :func:`adf`, :func:`lmkpss`
