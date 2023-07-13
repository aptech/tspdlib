
pd_kpss
==============================================

Purpose
----------------

Computes the panel data KPSS test. 

Format
----------------
.. function:: { testd_hom, testd_het, m_lee_est, brks } = pd_kpss(y, model [, nbreak, bwl, varm, pmax, bCtl])
    :noindexentry:

    :param y: Wide format panel data.
    :type y: TxN matrix

    :param model: Model to be implemented.

        =========== ================================
        1           Constant (Hadri test).
        2           Constant and trend (Hadri test).
        3           Shift in the mean.
        4           Shift in mean and trend.
        =========== ================================

    :type model: Scalar

    :param nbreak: Optional, number of breaks to consider (up to 5). Default = 5.
    :type  nbreak: Scalar

    :param bwl: Optional, bandwidth for the spectral window. Default = round(4 * (T/100)^(2/9)).
    :type  bwl: Scalar

    :param varm: Optional, long-run consistent variance estimation method. Default = 1.

          =========== =====================================================
          1           iid.
          2           Bartlett.
          3           Quadratic Spectral (QS).
          4           SPC with Bartlett (Sul, Phillips & Choi, 2005)
          5           SPC with QS
          6           Kurozumi with Bartlett
          7           Kurozumi with QS
          =========== =====================================================

    :type varm: Scalar

    :return test_hom: Panel test statistic assuming homogenous variance.
    :rtype test_hom: Scalar

    :return test_het: Panel test statistic assuming heterogenous variance.
    :rtype test_het: Scalar

    :return m_lee_est: Contains results for each individual group. First column contains KPSS test statistic, second column contains the optimal number of lags selected using the mlwz criteria.
    :rtype m_lee_est: Matrix

    :return brks: Estimated breaks. Breaks for each individual group are contained in separate rows.
    :rtype brks: Scalar

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load data
  data = loadd(__FILE_DIR $+ "pd_gdef.gdat");
  data = setColDateFormats(data, "%Y", "Year");
  
  // Set model to  hve break in constant and trend
  model = 4;
  
  // Compute panel data test
  { test_hom, test_het, kpsstest, m_br} = pd_kpss(data, model);

  // Plot results
  plotPDKPSS(data, m_br, kpsstest);

Source
------

pd_kpss.src

.. seealso:: Functions :func:`kpss_1break`, :func:`kpss_2breaks`, :func:`lmkpss`
