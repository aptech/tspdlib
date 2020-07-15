
cips
==============================================

Purpose
----------------

A simple unit root test in the presence of cross-section dependence.

Format
----------------
.. function:: { Ncadf, Nmcadf, Nlags, pcadf, pmcadf } = CIPS(y, model, pmax, ic)


    :param y: Wide panel data set to be tested.
    :type y: TxN matrix

    :param model: Model to be implemented.

          =========== ======================
          0           None.
          1           Constant.
          2           Constant and trend.
          =========== ======================

    :type model: Scalar

    :param pmax: The maximum number of lags for Dy.
    :type pmax: Scalar

    :param ic: The information criterion used for choosing lags.

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

  // Date dimensions
  N    = 24;
  T    = 112;

  // Load date file
  y = loadd(__FILE_DIR $+ "PDe.dat");

  // Set up model
  // 0 = None
  // 1 = constant
  // 2 = linear trend
  model= 1;

  // Max lags for ADF regression
  pmax = 4;

  // Information Criterion:
  // 1=Akaike
  // 2=Schwarz
  // 3=t-stat significance
  ic   = 3;

  { Ncadf, Nlm, Nmcadf, Nlags, pcadf, pmcadf } = cips(y, model, pmax, ic);

  "Test            Stat.   p-value";
  "CIPS         ";;
  pcadf;;
  "    NA  ";
  "Modified CIPS";;
  pmcadf;;
  cdfn(pmcadf);
  "";
  "    id      CADF     LM       M-CADF   pval    Lags ";
  seqa(1, 1, N)~Ncadf~Nlm~Nmcadf~cdfchic(abs(Nmcadf), q)~Nlags;


Source
------

lm.src

.. seealso:: Functions :func:`lm_1break`, :func:`lm_2break`
