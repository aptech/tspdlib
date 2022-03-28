TSPDLIB
==============================================

Description
----------------
Unit root, cointegration, and causality testing tools for time series and panel data.

It includes extensive coverage of testing in the presence of structural breaks.

Installation
--------------
The GAUSS Time Series and Panel data tests library can be installed and updated directly in GAUSS using the GAUSS package manager. It requires a working copy of GAUSS 21+.
Commands

Time Series Stationarity Tests
+++++++++++++++++++++++++++++++
:func:`adf`
:func:`adf_1br`
:func:`adf_2br`
:func:`fourier_adf`
:func:`fourier_gls`
:func:`fourier_kpss`
:func:`fourier_lm`
:func:`kpss_1break`
:func:`kpss_2break`
:func:`lm_1break`
:func:`lm_2break`
:func:`lmkpss`
:func:`pp`
:func:`quantile_adf`
:func:`rals_adf`
:func:`ralslm`
:func:`ralslm_break`
:func:`mgls`
:func:`erspt`

Panel Data Unit Root Tests
+++++++++++++++++++++++++++
:func:`cips`
:func:`BNG_PANIC`
:func:`BNG_PANICnew`
:func:`JWL_PANICadj`
:func:`pdfzk`

Cointegration Tests
+++++++++++++++++++++
:func:`coint_egranger`
:func:`coint_cissano`
:func:`coint_ghansen`
:func:`coint_hatemij`
:func:`coint_pouliaris`
:func:`coint_shin`
:func:`coint_tsongetal`
:func:`coint_maki`

Causality Tests
+++++++++++++++++
:func:`granger`

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
