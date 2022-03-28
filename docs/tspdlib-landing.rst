TSPDLIB
==============================================

Description
----------------
Unit root, cointegration, and causality testing tools for time series and panel data.
Includes extensive coverage of testing in the presence of structural breaks.

Installation
--------------
The GAUSS Time Series and Panel data tests library can be installed and updated directly in GAUSS using the GAUSS package manager. It requires a working copy of GAUSS 21+.
Commands

Time Series Stationarity Tests
+++++++++++++++++++++++++++++++

  ========================== ===========================================================================================================

  :func:`adf`                Augmented Dickey-Fuller unit root test.
  :func:`adf_1br`            Augmented Dickey-Fuller unit root test with one structural break.
  :func:`adf_2br`            Augmented Dickey-Fuller unit root test with two structural breaks.
  :func:`fourier_adf`        Augmented Dickey-Fuller unit root test with flexible Fourier form structural breaks.
  :func:`fourier_gls`        Local generalized least squares unit root test with flexible Fourier form structural breaks.
  :func:`fourier_kpss`       KPSS stationarity test with flexible Fourier form structural breaks.
  :func:`fourier_lm`         LM unit root test with flexible Fourier form structural breaks.
  :func:`kpss_1break`        KPSS stationary test with one structural break.
  :func:`kpss_2break`        KPSS stationary test with two structural breaks.
  :func:`lm_1break`          LM unit root test with one structural break.
  :func:`lm_2break`          LM unit root test with two structural breaks.
  :func:`lmkpss`             Performs the Kwiatkowski, Phillips, Schmidt, and Shin (KPSS) stationarity test.
  :func:`pp`                 Phillips and Perron unit root test (Perron, P., & Ng, S. (1996)).
  :func:`quantile_adf`       Quantile augmented Dickey-Fuller unit root test.
  :func:`rals_adf`           Augmented Dickey-Fuller unit root test with the RALS technique for non-normal errors.
  :func:`ralslm`             LM unit root test with the RALS technique for non-normal errors.
  :func:`ralslm_break`       Augmented Dickey-Fuller unit root test with 1 or 2 breaks and the RALS technique for non-normal errors.
  :func:`mgls`               MGLS unit root test.
  :func:`erspt`              ERS point optimal unit root test.

  ========================== ===========================================================================================================

Panel Data Unit Root Tests
+++++++++++++++++++++++++++

  ========================== =======================================================================================================================================================

  :func:`cips`               A simple unit root test in the presence of cross-section dependence.
  :func:`BNG_PANIC`          Panel analysis of idiosyncratic and common components (PANIC) test of nonstationarity. Computes the Pe test on ADF p-values found in Bai & Ng (2004).
  :func:`BNG_PANICnew`       Panel analysis of idiosyncratic and common components (PANIC) test of nonstationarity. Pooled Pa, Pb, and PMSB tests in Bai & Ng (2010).
  :func:`JWL_PANICadj`       Panel analysis of idiosyncratic and common components (PANIC) test of nonstationarity. Computes the Ze and Ze+ tests in Westerlund & Larsson (2009).
  :func:`pdfzk`              Panel stationary test with gradual shifts.

  ========================== =======================================================================================================================================================



Cointegration Tests
+++++++++++++++++++++

  ========================== =======================================================================================================================================================

  :func:`coint_egranger`     Engle-Granger residual-based test of the null hypothesis of no cointegration.
  :func:`coint_ghansen`      Test of the null hypothesis of no cointegration against the alternative of cointegration with a structural break in the mean.
  :func:`coint_cissano`      Lagrange Multiplier‐type statistic to test the null hypothesis of cointegration allowing for the possibility of a structural break.
  :func:`coint_hatemij`      Test of the null hypothesis of no cointegration against the alternative of cointegration with two structural breaks.
  :func:`coint_pouliaris`    Asymptotic critical values for residual based tests for cointegration.
  :func:`coint_shin`         A residual-based test for the null of cointegration using a structural single equation model.
  :func:`coint_tsongetal`    Test of the null hypothesis of cointegration allowing for structural breaks of unknown form in deterministic trend by using the Fourier form.
  :func:`coint_maki`         Test of the null hypothesis of no cointegration against the alternative of cointegration with an unknown number of breaks.

  ========================== =======================================================================================================================================================

Causality Tests
+++++++++++++++++

  ========================== =======================================================================================================================================================

  :func:`granger`            Tests for Granger causality of specified variables.
  :func:`panel_fisher`       Tests for Granger causality in heterogeneous mixed panels with bootstrap critical values.
  :func:`panel_surwald`      Tests for Granger causality in heterogeneous mixed panels with bootstrap critical values.
  :func:`panel_zhnc`         Tests for Granger causality in heterogeneous mixed panels with bootstrap critical values.

  ========================== =======================================================================================================================================================


Further Reading
-----------------

* `How to Conduct Unit Root Tests in GAUSS <https://www.aptech.com/blog/how-to-conduct-unit-root-tests-in-gauss/>`_
* `How to Interpret Cointegration Test Results <https://www.aptech.com/blog/how-to-interpret-cointegration-test-results/>`_
* `How to Run the Maki Cointegration Test (Video) <https://www.aptech.com/blog/how-to-run-the-maki-cointegration-test-video/>`_
* `Introduction to Granger Causality <https://www.aptech.com/blog/introduction-to-granger-causality/>`_
* `How to Run the Fourier LM Test <https://www.aptech.com/blog/how-to-run-the-fourier-lm-test-video/>`_


Reference
----------
The tspdlib library is written for GAUSS by Saban Nazlioglu, Department of International Trade & Finance, Pamukkale University-Türkiye.

If using this code please include the following citation:
Nazlioglu, S (2021) TSPDLIB: GAUSS Time Series and Panel Data Methods (Version 2.0). Source Code. https://github.com/aptech/tspdlib
