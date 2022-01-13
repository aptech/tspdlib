
JWL_PANICadj
==============================================

Purpose
----------------

Panel analysis of idiosyncratic and common components (PANIC) test of nonstationarity. Computes the Ze and Ze+ tests in Westerlund & Larsson (2009).

Format
----------------
.. function:: { Ze, Ze_ba } = JWL_PANICadj(y, model[, pmax[, ic_lags[, kmax[, ic_factors]]]])
    :noindexentry:

    :param y: Panel data to be tested.
    :type y: TxN matrix

    :param model: Model to be implemented.

        =========== ====================
        1           Constant.
        2           Constant and trend.
        =========== ====================

    :type model: Scalar


    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic_lags: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ====================
        1           Akaike.
        1           Schwarz.
        2           t-stat significance.
        =========== ====================

    :type ic_lags: Scalar

    :param kmax: Maximum number of factors. Maximum = Default = 5.
    :type kmax: Scalar

    :param ic_factors: Information Criterion for optimal number of factors. Default = 1.

        =========== ==============
        1           PCp criterion.
        2           ICp criterion.
        =========== ==============

    :type ic_factors: Scalar

    :return Ze: Ze statistic based on principal components with N(0,1).
    :rtype Ze: Scalar

    :return Ze_ba: Bias-adjusted Ze statistic based on principal components with N(0,1).
    :rtype Ze_ba: Scalar


Examples
---------

::

  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "PDe.dat");

  // Model with constant
  model = 1;
  { Ze, Ze_ba } = JWL_PANICadj(y, model);

Source
------

pd_panic.src

.. seealso:: Functions :func:`BNG_PANIC`, :func:`JWR_PANICCA`, :func:`BNG_PANICnew`
