
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

    :param bCtl: Optional, an instance of the sbControl structure, containing controls for structural estimation. Contains the following members:
       
        .. list-table::
            :widths: auto

            * - bctl.eps1
              - scalar, Value of the trimming (in percentage) for the construction and critical values of the supF ype tests (used in the supF test, the Dmax, the supF(l+1|l) and the sequential procedure). Default = 0.15.             
            * - bctl.fixb
              - scalar, Set to 1 to use fixed initial values for beta. Default = 0.
            * - bctl.betaini
              - vector, Loaded initial values of beta. Must be set if fixb = 1.
            * - bctl.maxi
              - scalar, Maximum number of iterations for the nonlinear procedure to obtain global minimizers. Default = 20.
            * - bctl.printd
              - scalar, Set to 1 to print output from the iterations. Default = 0.
            * - bctl.eps
              - scalar, Criterion for convergence. Default = 0.0001.
            * - bctl.robust
              - scalar, Set to 1 to allow for heterogeneity and autocorrelation the in residuals, 0 otherwise. The method used is Andrews(1991) automatic
                bandwidth with AR(1) approximation and the quadratic quernel. Note: Do not set to 1 if lagged dependent variables are included as regressors. Default = 1.
            * - bCtl.prewhit
              - scalar, Set to 1 if want to apply AR(1) prewhitening prior to estimating the long run covariance matrix. Default = 0.
            * - bCtl.hetdat
              - scalar, Option for the construction of the F-tests. Set to 1 if want to allow different moment matrices of the regressors accross segments. If hetdat = 0, the same
                moment matrices are assumed for each segment and estimated from the full sample. It is recommended to set hetdat=1. Default = 1.
            * - bCtl.hetvar
              - scalar, Option for the construction of the F-tests. Set to 1 if want to allow for the variance of the residuals to be different accross segments. If hetvar = 0, the variance 
                of the residuals is assumed constant across segments and constructed from full sample. This option is not available when robust = 1. Default = 0.
            * - bCtl.hetomega
              - scalar, Used in the construction of the confidence intervals for break dates. If hetomega=0, the long run covariance matrix of zu is assumed identical across segments 
                (the variance of the errors u if robust = 0). Default = 1.  
            * - bctl.h
              - scalar, Minimum segment size. Default = int(eps1*T).
            * - bctl.doglobal
              - scalar, Indicator to perform global test for structural break and find associated SSR for all break 1 to m.
            * - bctl.hetq
              - scalar, Used in the construction of the confidence intervals for the break dates. If hetq=0, the moment matrix of the data is assumed identical accross segments. Default = 1.
            * - bCtl.dotest
              - scalar, Set to 1 if want to construct the sup F, UDmax and WDmax tests. doglobal must be set to 1 to run this procedure. Default = 1.
            * - bCtl.dospflp1
              - scalar, Set to 1 if want to construct the sup(l+1|l) tests where under the null the l breaks are obtained using global minimizers. doglobal must be set to 1 to 
                run this procedure. Default = 1.
            * - bCtl.doorder
              - scalar, Set to 1 if want to call the procedure that selects the number of breaks using information criteria. doglobal must be set to 1 to run this procedure. Default = 1.
            * - bCtl.dosequa
              - scalar, Set to 1 if want to estimate the breaks sequentially and estimate the number of breaks using the supF(l+1|l) test. Default = 1
            * - bCtl.dorepart
              - scalar, Set to 1 if want to modify the break dates obtained from the sequential method using the repartition method of Bai (1995), Estimating breaks one at a time. This 
                is needed for the confidence intervals obtained with estim below to be valid. Default = 1.
            * - bCtl.estimbic
              - scalar, Set to 1 if want to estimate the model with the number of breaks selected by BIC. Default = 0.
            * - bCtl.estimlwz
              - scalar, Set to 1 if want to estimate the model with the number of breaks selected by LWZ. Default = 0.
            * - bCtl.estimseq
              - scalar, Set to 1 if want to estimate the model with the number of breaks selected using the sequential procedure. Default = 1.
            * - bCtl.estimrep
              - scalar, Set to 1 if want to esimate the model with the breaks selected using the repartition method. Default = 0.
            * - bCtl.estimfix
              - scalar, Set to 1 if want to estimate the model with a prespecified number of breaks equal to fixn set to 1. Default = 0.
            * - bCtl.fixn
              - scalar, Set to prespecified number of breaks if estimfix is set to 1.
:type bCtl: struct

    :return test_hom: Panel test statistic assuming homogenous variance.
    :rtype test_hom: scalar

    :return test_het: Panel test statistic assuming heterogenous variance.
    :rtype test_het: scalar

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
