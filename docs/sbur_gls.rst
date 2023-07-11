
sbur_gls
==============================================

Purpose
----------------

Procedure to estimate the structural breaks in a GLS-detrended framework. This procedure returns the unit root statistics.

Format
----------------
.. function:: sbOut = sbur_gls(y,  model [,  sburCtl])
    :noindexentry:

    :param y: Time series with the variable to be analysed.
    :type y: Tx1 vector

    :param model: Model to be implemented.

        =========== ====================================================
        1           Constant case,  without structural breaks.
        2           Linear time trend case, without structural breaks.
        3           Multiple breaks in level and slope of trend. 
        =========== =====================================================

    :type model: Scalar

    :param nbreak: Optional, number of breaks to consider (up to 5). Default = 5.
    :type  nbreak: Scalar

    :param sbCtl: Optional, an instance of the sburControl structure, containing the following members:
       
        .. list-table::
            :widths: auto

            * - sbctl.knownBreaks
              - scalar, specifies if breaks are known or unknown. 0 for known breaks, 1 for unknown breaks. Default = 1.
            * - sbctl.breakDate
              - vector, holds an known breaks dates. Default = none specified. 
            * - sbctl.numberBreaks
              - scalar, when the structural breaks are unknown, this scalar indicates the number of structural breaks that is assumed. Note that,  at the moment,  the procedure is designed for up to m <= 5 structural breaks.
            * - sbctl.penalty
              - scalar, indicates the penalty function that defines the information criteria that is used to determine the number of lags used to estimate the long-run variance. penalty = 0 for maic,  and penalty = 1 for bic. Default = 0.
            * - sbctl.kmax
              - scalar, denotes the maximum number of lags that is used to estimate the long-run variance. Default = 4.
            * - sbctl.kmin
              - scalar, denotes the minimum number of lags that is used to estimate the long-run variance. Default = 0.
            * - sbCtl.estimation
              - scalar, specifying the estimation method. 0 indicates brute force estimation, 1, uses the dynamic algorithm. Default = 0;
            * - sbCtl.prewhit
              - scalar, Set to 1 if want to apply AR(1) prewhitening prior to estimating the long run covariance matrix. Default = 0.
            * - sbCtl.maxIters
              - scalar, if dynamic algorithm is used, this indicates the maximum number of iterations. Default = 100;
                  
    :type sbCtl: struct
                  
    :return sbOut: An instance of the sburOut structure, containing the following members:
        .. list-table::
            :widths: auto

            * - sbOut.pt
              - scalar, the value for the Pt unit root test.
            * - sbOut.mpt 
              - scalar, the value for the MPT unit root test.
            * - sbOut.adf
              - scalar, the value for the ADF unit root test.
            * - sbOut.za
              - scalar, the value for the ZA unit root test.
            * - sbOut.mza
              - scalar, the value for the MZA unit root test.
            * - sbOut.msb
              - scalar, the value for the MSB unit root test.
            * - sbOut.mzt
              - scalar, the value for the MZT unit root test.
            * - sbOut.min_tb
              - Vector, the estimated break points.
            * - sbOut.cbar
              - scalar, the value of the c_bar parameter that is used in the quasi GLS-detrending.
                  
    
                  
                  
     :rtype sbOut: struct


Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load data
  data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/ts_examples.csv", "Y + date($Date, '%b-%y')");
  data = setColDateFormats(data, "%Y", "Year");
  
  /*
  ** This section sets parameters 
  ** for testing.
  */
  // Set up control structure
  struct sburControl msburCtl; 
  msburCtl = sburControlCreate();

  // Number of breaks
  msburCtl.numberBreaks = 2;

  // Model to use
  model = 3;

  /*
  ** Estimation method
  ** when = 1 we use the algorithm, 
  ** and = 0 brut force
  */
  msburCtl.estimation = 1;
  msburCtl.maxIters = 20;

  // Output structure
  struct sburOut msOut;
  msOut = sbur_gls(y, model, msburCtl);

Source
------

sbur.src

.. seealso:: Functions :func:`dfgls`, :func:`kpss_1break`, :func:`kpss_2breaks`, :func:`kpss_1break`, :func:`adf_1break`, :func:`adf_2breaks`
