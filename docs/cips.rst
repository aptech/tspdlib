
cips
==============================================

Purpose
----------------

Computes a panel data unit root test in the presence of cross-section dependence.

Format
----------------
.. function:: { Ncadf, Nmcadf, Nlags, pcadf, pmcadf } = CIPS(y, model[, pmax, ic])
    :noindexentry:

    :param y: Wide panel data set to be tested.
    :type y: TxN matrix

    :param model: Model to be implemented.

          =========== ======================
          0           None.
          1           Constant.
          2           Constant and trend.
          =========== ======================

    :type model: Scalar

    :param pmax: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

             =========== ==============
             1           Akaike.
             1           Schwarz.
             2           t-stat significance.
             =========== ==============

    :type ic: Scalar

    :return Ncadf: CADF statistics for each cross-section.
    :rtype Ncadf: Nx1 Vector

    :return Nmcadf: Modified CADF statistics for each cross-section.
    :rtype Nmcadf: Nx1 Vector

    :return Nlags: Number of lags selected by specified information criterion for each cross-section.
    :rtype Nlags:  Nx1 Vector

    :return pcadf: Panel CIPS statistic
    :rtype pcadf: Scalar

    :return pmcadf: Modified panel CIPS statistic
    :rtype pmcadf: Scalar

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // CADF and Modified CADF tests
  /*
  ** Using the defaults
  ** for maximum number of lags
  ** and information criterions,
  */

  // Set up model
  model = 1;
  { Ncadf, Nlm, Nmcadf, Nlags, pcadf, pmcadf } = cips(y, model);


Source
------

pd_cips.src
