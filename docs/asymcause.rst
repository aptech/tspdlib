
asymcause
==============================================

Purpose
----------------

Performcs the asymmetric causality tests of the hypothesis that z does not cause y. Based on original code provided by Abdulnasser Hatemi-J.

Format
----------------
.. function:: { Wstat, Wcv, ICOrder, Azdsys } = asymCause(y, z [, pos, infocrit, intorder, ln_form, maxlags, bootmaxiter, fullprint] )
    :noindexentry:

    :param y: Panel data variable of interest to be tested.
    :type y: TNx1 matrix

    :param z: Panel data to be tested for causation.
    :type z: TNx1 matrix
    
    :param pos: Optional, specifies whether to use positive or negative component. Default = 1.

        =========== ==============
        0           Negative.
        1           Positive.
        =========== ==============

    :type pos: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ==============
        1           AIC.
        2           AICC.
        3           SBC.
        4           HQC.
        5           HJC.
        6           Use max lags.
        =========== ==============

    :type ic: Scalar
        
    :param intorder: Optional, order of integration to adjust for unit roots. Default = 0.
    :type param: Scalar
    
    :param ln_form: Optional, specifies whether to use data in log form. Default = 0.

        =========== ==============
        0           No log.
        1           Log form.
        =========== ==============

    :type ln_form: Scalar
        
    :param maxlags: Optional, the maximum number of lags for :math:`\Delta y`. Default = 8.
    :type maxlags: Scalar

    :param bootmaxiter: Optional, number of bootstrap iterations. Default = 1000.
    :type bootmaxiter: Scalar

    :param fullprint: print full output including the Ahat predications and negative/positive components.  Default = 0;
    :type fullprint: Scalar

    :return Wstat: Wald statistic.
    :rtype Wstat: Scalar

    :return Wcv: Bootstrap 1%, 5%, and 10% critical values for the Wald statistic.
    :rtype Wcv: Vector

    :return ICOrder: Number of lags selected by chosen information criterion.
    :rtype ICOrder: Scalar

    :return Azdsys: Number of lags after the added lags for integration. 
    :rtype Azdsys: Scalar

Examples
--------

::

  library tspdlib;

  // Load date file
  YZlevel = packr(loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/nelsonplosser.dta", "m + bnd"));

  // Run test
  { Wstat, Wcv, ICOrder, Azdsys } = asymCause(YZlevel[., "m"], YZlevel[., "bnd"]);

Source
------

actest.src

