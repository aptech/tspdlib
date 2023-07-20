
pd_stationary
==============================================

Purpose
----------------

Computes the panel data KPSS test. 

Format
----------------
.. function:: { testd_hom, testd_het, m_lee_est, brks } = pd_stationary(y, model [, nbreak, bwl, varm, pmax, bCtl])
    :noindexentry:

    :param y: Wide format panel data.
    :type y: TxN matrix

    :param model: Optional, Model to be implemented.

        =========== ================================
        1           Constant (Default)
        2           Constant and trend 
        =========== ================================

    :type model: Scalar

    :param test: Optional, Test to be conducted. 
    
        =========== ======================================================
        "st"         Stationary tests, no modifications.
        "ca"         Based on CA (cross-section averages approach).
        "fourier"    CA approach with smooth breaks (fourier approach).
        "panic"      Based on PANIC approach
        =========== ======================================================
        
    :type test: String
    
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
    
    :param bwl: Optional, bandwidth for the spectral window. Default = round(4 * (T/100)^(2/9)).
    :type  bwl: Scalar

    :param kmax: Optional, maximum number of factors. Default = 5.
    :type kmax: Scalar

    :param ic: Optional, information criterion for optimal number of factors. Default = 1.

        =========== =====================
        1           Akaike.
        2           Schwarz.
        3           t-stat significance.
        =========== =====================

    :type ic: Scalar

    :return Nkpss: The KPSS statistics for each cross-section and the corresponding p-values.
    :rtype Nkpss: Dataframe

    :return W: Panel stationarity statistic by Hadri (2000) and the corresponding p-value.
    :rtype W: Scalar

    :return P: Panel stationarity statistic by Yin & Wu (2001) and the corresponding p-value.
    :rtype P: Matrix

    :return Pm: Panel stationarity statistic by Nazlioglu et al. (2021) and the corresponding p-value.
    :rtype Pm: Scalar
        
    :return Z: Panel stationarity statistic by Nazlioglu et al. (2021) and the corresponding p-value. 
    :rtype Z: Matrix

Examples
--------

::

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", 
                                ". + date($Date, '%b-%y')");

  /*
  ** Classical panel stationarity test
  */
  // With constant
  model = 1;
  { Nkpss, W, P, Pm, Z} = pd_stationary(y, model);

  /*
  ** Cross-section approach panel stationarity test 
  */

  // Set test
  test = "ca";

  // With constant
  model = 1;

  { Nkpss, W, P, Pm, Z} = pd_stationary(y, model, test);

Source
------

pd_stationary.src

.. seealso:: Functions :func:`pd_kpss`, :func:`pdfzk`, :func:`pdlm`
