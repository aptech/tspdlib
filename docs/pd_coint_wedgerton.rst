coint_cissano
==============================================

Purpose
----------------

Computes the Westerlund-Edgerton test of the null hypothesis of cointegration allowing for the possibility structural breaks.

Format
----------------
.. function:: { brks, lmn, nf } = pd_coint_wedgerton(y, x, model [, p, q, trimm, kmax])
    :noindexentry:

    :param y: Dependent variable.
    :type y: TxN matrix

    :param x: Independent variable.
    :type x: TxN matrix

    :param model: Model to be implemented.

          =========== ==============
          0           No shift.
          1           Level shift.
          2           Regime shift.
          =========== ==============

    :type model: Scalar

    :param p: Optional, the number of autoregressive lags to include. Default = int(4 * (t/100)^(2/9)).
    :type p: Scalar

    :param q: Optional, number of lags to include in the long-run variance estimation. Default = int(4 * (t/100)^(2/9)).
    :type q: Scalar
    
    :param trimm: Optional, trimming rate. Default = 0.10.
    :type trimm: Scalar

    :param kmax: Optional, the maximum number of factors to include. Default = 5.
    :type kmax: Scalar   

    :return brks: Break dates.
    :rtype brks: Vector

    :return lmn: Test statistics. 
    :rtype lmn: Vector

    :return nf: The number of factors.
    :rtype nf: Scalar

Examples
--------

::

  library tspdlib;

  // Load data
  dat = loadd(__FILE_DIR $+ "pd_brics.gdat");

  // This panel has 5 countries
  N = 5;

  /*
  ** Note that the data needs 
  ** to be wide format so we 
  ** need to reshape the data
  */
  // Get x data
  y = reshape(dat[., "lco2"], N, rows(dat)/N)';

  // Separate y
  x = reshape(dat[., "ly"], N, rows(dat)/N)';

  // Get year
  year = asDate(unique(dat[., "Year"]), "%Y");

  // Deterministic component
  // 0 = no shift,
  // 1 = level shift,
  // 2 = regime shift
  model = 1;

  // Estimate breaks and test for cointegration
  { brks, lmn, nf } = pd_coint_wedgerton(year~y, x, model);


Source
------

pd_coint_wedgerton.src

.. seealso:: Functions :func:`coint_egranger`, :func:`coint_ghansen`, :func:`coint_hatemij`, :func:`coint_maki`
