
BNG_PANIC
==============================================

Purpose
----------------

Panel analysis of idiosyncratic and common components (PANIC) test of nonstationarity. Computes the Pe test on ADF p-values found in Bai & Ng (2004).

Format
----------------
.. function:: { ADFe, pval, lags, Pe, n_factors } = BNG_PANIC(y, model[, pmax, ic_lags, kmax, ic_lags])
    :noindexentry:

    :param y: Panel data to be tested.
    :type y: TxN matrix

    :param model: Model to be implemented.

        =========== ==============
        1           Constant.
        2           Constant and trend.
        =========== ==============

    :type model: Scalar

    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic_lags: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ==============
        1           Akaike.
        1           Schwarz.
        2           t-stat significance.
        =========== ==============

    :type ic_lags: Scalar

    :param kmax: Maximum number of factors. Maximum = Default = 5.
    :type kmax: Scalar

    :param ic_factors: Information Criterion for optimal number of factors. Default = 1.

        =========== ==============
        1           PCp criterion.
        2           ICp criterion.
        =========== ==============

    :type ic_factors: Scalar

    :return ADFe: ADF statistic for idiosyncratic components for each cross-section.
    :rtype ADFe: Scalar

    :return pval: p-value of ADFe.
    :rtype pval: Scalar

    :return lags: Number of lags selected by chosen information criterion.
    :rtype lags: Scalar

    :return Pe: Pe statistic based on principal components with N(0,1).
    :rtype Pe: Scalar

    :return n_factors: Number of factors by chosen information criterion
    :rtype n_factors: Scalar

Examples
---------

::

  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "PDe.dat");

  /*
  ** Using the defaults
  ** for maximum number of lags,
  ** information criterions,
  ** and maximum number of factors.
  */

  /*
  ** Model with constant
  */
  model = 1;
  { ADFe, pval, lags, Pe, nf } = BNG_PANIC(y, model);

Source
------

pd_panic.src

.. seealso:: Functions :func:`BNG_PANICnew`, :func:`JWL_PANICadj`, :func:`JWR_PANICCA`
