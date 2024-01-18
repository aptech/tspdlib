# GAUSS Time Series and Panel data tests
Econometric package for Time Series and Panel Data Methods covering unit root, co-integration & causality tests. Extensive coverage of testing in the presence of [structural breaks](https://www.aptech.com/structural-breaks/).

The `tspdlib` library is written for GAUSS by [Saban Nazlioglu](mailto:snazlioglu@pau.edu.tr), Department of International Trade & Finance, Pamukkale University-Türkiye.

## Citation
If using this code please include the following citation:
Nazlioglu, S (2021) TSPDLIB: GAUSS Time Series and Panel Data Methods (Version 2.0). Source Code. https://github.com/aptech/tspdlib

## Getting Started
### Prerequisites
The program files require a working copy of **GAUSS 23+**. 

### Installing
The GAUSS Time Series and Panel data tests library can be installed and updated directly in GAUSS using the [GAUSS package manager](https://www.aptech.com/blog/gauss-package-manager-basics/).

**Please do not download the source code and install manually. You will not be able to properly install the library.**

Before using the functions created by `tspdlib` you will need to load the newly created `tspdlib` library. This can be done in a number of ways:
  *   Navigate to the library tool view window and click the small wrench located next to the `tspdlib` library. Select `Load Library`.  
  ![load library](images/load_tspdlib.PNG)
  *  Enter `library tspdlib` in the program input/output window.
  *  Put the line `library tspdlib;` at the beginning of your program files.

>  Note: I have provided the individual files found in [`tspdlib_2.0.zip`](https://github.com/aptech/tspdlib/releases) for examination and review. However, installation should always be done using the GAUSS Package Manager.

### Examples
After installing the library, examples for all available procedures can be found in your **GAUSS** home directory in the directory **pkgs > tspdlib >examples**. The example uses **GAUSS** and .csv datasets which are included in the **pkgs > tspdlib >examples** directory.

### Related Blogs
The TSPDLIB library has been featured in the following [Aptech Data Analytics blog](https://www.aptech.com/blog/) posts:
1. [Introduction to Granger Causality](https://www.aptech.com/blog/introduction-to-granger-causality/)
2. [How to Run the Fourier LM Test (Video)](https://www.aptech.com/blog/how-to-run-the-fourier-lm-test-video/)
3. [How to Run the Maki Cointegration Test (Video)](https://www.aptech.com/blog/how-to-run-the-maki-cointegration-test-video/)
4. [How to Interpret Cointegration Test Results](https://www.aptech.com/blog/how-to-interpret-cointegration-test-results/)
5. [How to Conduct Unit Root Tests in GAUSS](https://www.aptech.com/blog/how-to-conduct-unit-root-tests-in-gauss/)
6. [The Structural VAR Model At Work: Analyzing Monetary Policy](https://www.aptech.com/blog/the-structural-var-model-at-work-analyzing-monetary-policy/)
7. [Panel Data, Structural Breaks and Unit Root Testing](https://www.aptech.com/blog/panel-data-structural-breaks-and-unit-root-testing/)
8. [Unit Root Tests with Structural Breaks](https://www.aptech.com/blog/unit-root-tests-with-structural-breaks/)
9. [A Guide To Conduction Cointegration Tests](https://www.aptech.com/blog/a-guide-to-conducting-cointegration-tests/)

### Documentation
The documentation for the `tspdlib` procedures can be found on our [Aptech TSPDLIB Documentation page](https://docs.aptech.com/gauss/tspdlib/docs/index.html).

## License
The author makes no performance guarantees. The `tspdlib` is available for public non-commercial use only.

## Author
For any bugs, please send e-mail to [Saban Nazlioglu](mailto:snazlioglu@pau.edu.tr) or [Eric Clower](mailto:eric@aptech.com).

## Supported
### Time Series Unit Root Tests
|src file| Reference|Description|
|:------:|:---------|:------------|
|[`adf`](https://docs.aptech.com/gauss/tspdlib/docs/adftspd.html)| [Dickey, D.A., Fuller, W.A. (1979)](https://www.jstor.org/stable/2286348?seq=1#page_scan_tab_contents). Distribution of the estimators for autoregressive time series with a unit root. Journal of the American Statistical Society75, 427–431.| ADF unit root test.|
|[`adf_1break`](https://docs.aptech.com/gauss/tspdlib/docs/adf_1br.html)| [Zivot, E. & Andrews, W.K. (1992)](http://cba2.unomaha.edu/faculty/mwohar/WEB/links/Econometrics_papers/Zivot_Andrews.pdf). Further evidence on the great crash, the oil-price shock, and the unit root hypothesis. Journal of Business and Economic Statistics 10(3), 251-270. |ADF unit root test with a single break.|
|[`adf_2break`](https://docs.aptech.com/gauss/tspdlib/docs/adf_2br.html)|[Narayan, P.K. & Popp, S. (2010)](https://www.researchgate.net/publication/227345783_A_New_Unit_Root_Test_with_Two_Structural_Breaks_in_Level_and_Slope_at_Unknown_Time). A new unit root test with two structural breaks in level and slope at unknown time. Journal of Applied Statistics, 37:9, 1425-1438.|Unit root test with two unknown breaks.|
|[`erspt`](https://docs.aptech.com/gauss/tspdlib/docs/erspt.html)|[Elliott, G., Rothenberg, T.J., Stock, J.H. (1996)](https://www.jstor.org/stable/2171846). Efficient tests for an autoregressive unit root. Econometrica, 64, 813-836.|ERS point optimal unit root test.|
|[`fourier_adf`](https://docs.aptech.com/gauss/tspdlib/docs/fourier_adf.html)|[Enders, W. & Lee, J. (2012)](https://ideas.repec.org/a/eee/ecolet/v117y2012i1p196-199.html). The flexible Fourier form and Dickey-Fuller type unit root tests. Economics Letters, 117, 196-199.|Dickey-Fuller unit root test with Flexible Fourier form structural breaks.
|[`fourier_lm`](https://docs.aptech.com/gauss/tspdlib/docs/fourier_lm.html)|[Enders, W., and Lee, J. (2012)](http://www.time-series.net/yahoo_site_admin/assets/docs/Enders_Lee_Final_version_May_16_2011.39101351.pdf). A Unit Root Test Using a Fourier Series to Approximate Smooth Breaks. Oxford Bulletin of Economics and Statistics,74,4(2012),574-599.|LM unit root test with Flexible Fourier form structural breaks.
|[`fourier_kpss`](https://docs.aptech.com/gauss/tspdlib/docs/fourier_kpss.html)|[Becker, R., Enders, W., Lee, J. (2006)](https://econpapers.repec.org/article/blajtsera/v_3a27_3ay_3a2006_3ai_3a3_3ap_3a381-409.htm). A stationarity test in the presence of an unknown number of smooth breaks. Journal of Time Series Analysis, 27(3), 381-409.|KPSS stationarity test with Flexible Fourier form structural breaks. |
|[`fourier_gls`](https://docs.aptech.com/gauss/tspdlib/docs/fourier_gls.html)|[Rodrigues, P. & Taylor, A.M.R. (2012)](https://www.bportugal.pt/sites/default/files/anexos/papers/wp200919.pdf). The flexible Fourier form and local GLS de-trending unit root tests. Oxford Bulletin of Economics and Statistics, 74(5), 736-759.|GLS detrended unit root test with Flexible Fourier form structural breaks. |
|[`fourier_kss`](https://docs.aptech.com/gauss/tspdlib/docs/fourier_kss.html)|[Christopoulos, D. K., & Leon-Ledesma, M. A. (2010)](https://www.sciencedirect.com/science/article/abs/pii/S0261560610000215). Smooth breaks and non-linear mean reversion: Post-Bretton Woods real exchange rates. Journal of International Money and Finance, 29(6), 1076-1093.|KSS unit root test with Flexible Fourier form structural breaks. |
|[`gls`](https://docs.aptech.com/gauss/tspdlib/docs/glstspd.html)|[Elliott, G., Rothenberg, T.J., Stock, J.H. (1996).](https://pdfs.semanticscholar.org/0ab9/d8b131e643d088b27c2e37fa6978b6424a89.pdf) Efficient tests for an autoregressive unit root. Econometrica 64, 813-836.|GLS-ADF unit root test. |
|[`gls`](https://docs.aptech.com/gauss/tspdlib/docs/glstspd.html)|[Ng, S., Perron, P. (2001).](http://www.columbia.edu/~sn2294/pub/ecta01.pdf)  Lag length selection and the construction of unit root tests with good size and power.  Econometrica 69, 1519-1554.| Lag selection in unit root tests.|
|[`gls_1break`](https://docs.aptech.com/gauss/tspdlib/docs/gls_1break.html)|[Perron, P., & Rodriguez, G. (2003).](https://www.sciencedirect.com/science/article/abs/pii/S0304407603000903)  GLS detrending, efficient unit root tests and structural change.  Journal of Econometrics 115(1), 1-27.| GLS unit root test with one structural break.|
|[`gls_2break`](https://docs.aptech.com/gauss/tspdlib/docs/gls_2break.html)|[Carrion-i-Silvestre, J. L., Kim, D., & Perron, P. (2009).](https://www.researchgate.net/publication/46544706_GLS-Based_Unit_Root_Tests_with_Multiple_Structural_Breaks_Both_Under_the_Null_and_the_Alternative_Hypothesis) GLS-based unit root tests with multiple structural breaks under both the null and alternative hypotheses.  Econometric Theory 25, 1754-1792.| GLS unit root test with two structural breaks.|
|[`kpss`](https://docs.aptech.com/gauss/tspdlib/docs/lmkpss.html)|[Kwiatkowski, D., Phillips, P. C., Schmidt, P., & Shin, Y (1992)](http://debis.deu.edu.tr/userweb//onder.hanedar/dosyalar/kpss.pdf). Testing the null hypothesis of stationarity against the alternative of a unit root: How sure are we that economic time series have a unit root?.  Journal of Econometrics, 4(1-3), 159-178.|KPSS test for the null of stationarity.|
|[`kpss_1br`](https://docs.aptech.com/gauss/tspdlib/docs/kpss_1break.html)|[Kurozumi, E. (2002)](https://rmgsc.cr.usgs.gov/outgoing/threshold_articles/Kurozumi2002.pdf). Testing for stationarity with a break. Journal of Econometrics, 108(1), 63-99.|KPSS test for the null of stationarity with one structural break.|
|[`kpss_2br`](https://docs.aptech.com/gauss/tspdlib/docs/kpss_2break.html)|[Carrion-i-Silvestre, J. Ll. & Sansó, A. (2007)](https://www.researchgate.net/publication/24064952_The_KPSS_test_with_two_structural_breaks). The KPSS test with two structural breaks. Spanish Economic Review, 9, 2, 105-127.|KPSS test for stationarity with two structural breaks.|
|[`lmkpss`](https://docs.aptech.com/gauss/tspdlib/docs/lmkpss.html)| [Schmidt, P., & Phillips, P. C. (1992)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1468-0084.1992.tb00002.x). LM tests for a unit root in the presence of deterministic trends. Oxford Bulletin of Economics and Statistics, 54(3), 257-287.|LM test for a unit root.|
|[`lm_1break`](https://docs.aptech.com/gauss/tspdlib/docs/kpss_1break.html)| [Lee, J. & Strazicich, Mark C. (2013)](https://econpapers.repec.org/article/eblecbull/eb-13-00296.htm). Minimum LM unit root test with one structural break. Economics Bulletin 33(4), 2483-2492.|LM unit root test with one structural break.|
|[`lm_2breaks`](https://docs.aptech.com/gauss/tspdlib/docs/lm_2break.html)| [Lee, J. & Strazicich, M.C. (2003)](https://libres.uncg.edu/ir/asu/f/Strazicich_Mark_2003_Minimum_Lagrange.pdf). Minimum Lagrange Multiplier unit toot test with two structural breaks. Review of Economics and Statistics 85(4), 1082-1089.|LM unit root test with two structural breaks.|
|[`mgls`](https://docs.aptech.com/gauss/tspdlib/docs/mgls.html)| [Ng, S., Perron, P. (2001)](https://onlinelibrary.wiley.com/doi/abs/10.1111/1468-0262.00256). Lag length selection and the construction of unit root tests with good size and power. Econometrica 69, 1519-1554.|MGLS unit root test.|
|[`pp`](https://docs.aptech.com/gauss/tspdlib/docs/pp.html)| [Phillips, P.C.B., Perron, P. (1988)](https://www.jstor.org/stable/2336182). Testing for a unit root in time series regressions. Econometrica 75, 335-346.|Phillips and Perron unit root test.|
|[`qks_tests`](https://docs.aptech.com/gauss/tspdlib/docs/qr_qks.html)|[Bahmani�-Oskooee, M., Chang, T., Niroomand, F., & Ranjbar, O. (2020)](https://doi.org/10.1111/boer.12230). Fourier nonlinear quantile unit root test and PPP in Africa. Bulletin of Economic Research, 72(4), 451-481.| Quantile Kolmogorov-Smirnov (QKS) tests|
|[`qr_adf`](https://docs.aptech.com/gauss/tspdlib/docs/qr_adf.html)|[Koenker, R. & Xiao, Z. (2004)](https://www.jstor.org/stable/27590447?seq=1#page_scan_tab_contents). Unit root quantile autoregression inference. Journal of the American Statistical Association, 99(467), 775-787.| Quantile ADF unit root test.|
|[`qr_fourier_adf`](https://docs.aptech.com/gauss/tspdlib/docs/qr_fourier_adf.html)|[Li, H., & Zheng, C. (2018)](https://doi.org/10.1016/j.frl.2017.10.008). Unit root quantile autoregression testing with smooth structural changes. Finance Research Letters, 25, 83-89.| Quantile Augmented Dickey-Fuller unit root test with flexible Fourier form structural breaks.|
|[`qr_fourier_kss`](https://docs.aptech.com/gauss/tspdlib/docs/qr_fourier_kss.html)[Bahmani�-Oskooee, M., Chang, T., Niroomand, F., & Ranjbar, O. (2020)](https://doi.org/10.1111/boer.12230). Fourier nonlinear quantile unit root test and PPP in Africa. Bulletin of Economic Research, 72(4), 451-481.| Quantile Augmented KSS unit root test with flexible Fourier form structural breaks.|
|[`qr_kss`](https://docs.aptech.com/gauss/tspdlib/docs/qr_kss.html)[Li, H., & Park, S. Y. (2018)](https://doi.org/10.1080/00927872.2016.1178871). Testing for a unit root in a nonlinear quantile autoregression framework. Econometric Reviews, 37(8), 867-892.| Quantile Augmented KSS unit root test.|
|[`rals_adf`](https://docs.aptech.com/gauss/tspdlib/docs/ralsadf.html)|[Im, K. S., Lee, J., & Tieslau, M. A. (2014)](https://www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/snde-2016-0050.xml). More powerful unit root tests with non-normal errors. In Festschrift in Honor of Peter Schmidt (pp. 315-342). Springer New York.|RALS-ADF unit root test for non-normal errors.|
|[`rals_lm`](https://docs.aptech.com/gauss/tspdlib/docs/ralslm_breaks.html)|[Meng, M., Im, K. S., Lee, J., & Tieslau, M. A. (2014)](https://www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/snde-2016-0050.xml). More powerful LM unit root tests with non-normal errors. In Festschrift in Honor of Peter Schmidt (pp. 343-357). Springer New York.|RALS-LM unit root test for non-normal errors.|
|[`ralslm_breaks`](https://docs.aptech.com/gauss/tspdlib/docs/ralslm.html)|[Meng, M., Lee, J., & Payne, J. E. (2017)](https://www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/snde-2016-0050.xml). RALS-LM unit root test with trend breaks and non-normal errors: application to the Prebisch-Singer hypothesis. Studies in Nonlinear Dynamics & Econometrics, 21(1), 31-45.|RALS-LM unit root test for non-normal errors with 1 or 2 breaks.|

### Panel Data Unit Root Tests
|src file| Reference|Description|
|:------:|:---------|:----------|
|[`pd_cips`](https://docs.aptech.com/gauss/tspdlib/docs/cips.html)|[Pesaran, M.H. (2007).](https://onlinelibrary.wiley.com/doi/full/10.1002/jae.951) A simple unit root test in the presence of cross-section dependence. Journal of Applied Econometrics, 22 (2), 265-312.|Pesaran panel data unit root test with cross-section dependence.|
|[`pd_cips`](https://docs.aptech.com/gauss/tspdlib/docs/cips.html)|[Westerlund, J., & Hosseinkouchack, M. (2016).](https://onlinelibrary.wiley.com/doi/abs/10.1111/obes.12127) CADF and CIPS Panel Unit Root Statistics with Standard Chi‐squared and Normal Limiting Distributions. Oxford Bulletin of Economics and Statistics, 78(3), 347-364.| Modified Pesaran CIP and CADF with standard limiting distributions.|
|[`pd_panic`](https://docs.aptech.com/gauss/tspdlib/docs/bng_panic.html)|[Bai, J. & Ng, S. (2004)](http://www.columbia.edu/~jb3064/papers/2004_A_panic_attack_on_unit_roots_and_cointegration.pdf). A PANIC attack on unit roots and cointegration. Econometrica, 72, 1127–78.|Panel analysis of idiosyncratic and common components (PANIC) to test whether non-stationarity in a series is pervasive, variable-specific or both.|
|[`pd_panic`](https://docs.aptech.com/gauss/tspdlib/docs/jwr_panicca.html)|[Westerlund, J., & Larsson, R. (2009)](https://www.cambridge.org/core/journals/econometric-theory/article/note-on-the-pooling-of-individual-panic-unit-root-tests/7328B7103F2916320D17AFF28F1A2ACC#). A note on the pooling of individual PANIC unit root tests. Econometric Theory, 25(6), 1851-1868.|Panel analysis of idiosyncratic and common components (PANIC) to test whether non-stationarity in a series is pervasive, variable-specific or both.|
|[`pd_panic`](https://docs.aptech.com/gauss/tspdlib/docs/bng_panicnew.html)|[Bai, J., & Ng, S. (2010)](http://www.columbia.edu/~jb3064/papers/2010_Panel_unit_root_tests_with_cross_section_dependence-a_further_investigation.pdf). Panel unit root tests with cross-section dependence: a further investigation. Econometric Theory, 26(4), 1088-1114.|Panel analysis of idiosyncratic and common components (PANIC) to test whether non-stationarity in a series is pervasive, variable-specific or both.|
|[`pd_panic`](https://docs.aptech.com/gauss/tspdlib/docs/jwl_panicadj.html)|[Reese, S., & Westerlund, J. (2016)](https://project.nek.lu.se/publications/workpap/papers/wp15_3.pdf). PANICCA: PANIC on Cross‐Section Averages. Journal of Applied Econometrics, 31(6), 961-981.|Panel analysis of idiosyncratic and common components (PANIC) to test whether non-stationarity in a series is pervasive, variable-specific or both.|
|[`pd_panic`](https://docs.aptech.com/gauss/tspdlib/docs/bng_panic.html)|[Bai, J., & Ng, S. (2002)](http://www.econ.nyu.edu/user/baij/econometrica02.pdf). Determining the number of factors in approximate factor models. Econometrica, 70(1), 191-221.|Panel analysis of idiosyncratic and common components (PANIC) to test whether non-stationarity in a series is pervasive, variable-specific or both.|
|[`pd_iltlevel`](https://docs.aptech.com/gauss/tspdlib/docs/pdlm.html)|[Im, K., Lee, J., Tieslau, M. (2005)](https://pdfs.semanticscholar.org/794e/035e2af830b66f5d229cd444cbc8b34c3d83.pdf). Panel LM Unit-root Tests with Level Shifts, Oxford Bulletin of Economics and Statistics 67, 393–419.|Panel data LM unit root test with structural breaks in the level.|
|[`pd_lttrend`](https://docs.aptech.com/gauss/tspdlib/docs/pdlm.html)|[Lee, J., & Tieslau, M. (2017)](https://www.sciencedirect.com/science/article/pii/S0264999317316358). Panel LM unit root tests with level and trend shifts. Economic Modelling.|Panel data LM unit root test with structural breaks in the level and trend.|
|[`pd_nkarul`](https://docs.aptech.com/gauss/tspdlib/docs/pdfzk.html)|[Nazlioglu, S., & Karul, C. (2017)](https://econpapers.repec.org/article/eeeecmode/v_3a61_3ay_3a2017_3ai_3ac_3ap_3a181-192.htm). A panel stationarity test with gradual structural shifts: Re-investigate the international commodity price shocks. Economic Modelling, 61, 181-192.|Panel stationarity test with gradual structural breaks.|

### Time Series and Panel Data Causality Tests
|src file| Reference|Description|
|:------:|:---------|:-----------|
|[`GC_tests`](https://docs.aptech.com/gauss/tspdlib/docs/gc_tests.html)|[Granger, C.W.J. (1969).](https://www.jstor.org/stable/1912791) Investigating causal relations by econometric models and cross-spectral methods. Econometrica 37, 424–438.|Granger causality tests.|
|[`GC_tests`](https://docs.aptech.com/gauss/tspdlib/docs/gc_tests.html)|[Toda, H.Y. & Yamamoto, T. (1995).](https://econpapers.repec.org/article/eeeeconom/v_3a66_3ay_3a1995_3ai_3a1-2_3ap_3a225-250.htm) Statistical inference in vector autoregression with possibly integrated processes. Journal of Econometrics 66,225–250.|Tests on the general restrictions on the VAR parameter matrices even if the processes may be integrated or cointegrated of an arbitrary order.|
|[`GC_tests`](https://docs.aptech.com/gauss/tspdlib/docs/gc_tests.html)|[Enders, W., & P. Jones. (2016).](https://ideas.repec.org/a/bpj/sndecm/v20y2016i4p399-419n3.html) Grain prices, oil prices, and multiple smooth breaks in a var. Studies in Nonlinear Dynamics & Econometrics 20 (4):399-419.| Flexible Fourier form testing for smooth structural change in a VAR.|
|[`GC_tests`](https://docs.aptech.com/gauss/tspdlib/docs/gc_tests.html)|[Nazlioglu, S., Gormus, A. & Soytas, U. (2016).](https://ideas.repec.org/a/eee/eneeco/v60y2016icp168-175.html) Oil prices and real estate investment trusts (REITs): gradual-shift causality and volatility transmission analysis”. Energy Economics 60(1): 168-175.| New causality approach augmenting the Toda–Yamamoto method with a Fourier approximation.|
|[`GC_tests`](https://docs.aptech.com/gauss/tspdlib/docs/gc_tests.html)|[Gormus, A., Nazlioglu, S. & Soytas, U. (2018).](https://ideas.repec.org/a/eee/eneeco/v69y2018icp101-110.html) High-yield bond and energy markets. Energy Economics 69: 101-110.| New causality approach augmenting the Toda–Yamamoto method with a Fourier approximation.|
|[`GC_tests`](https://docs.aptech.com/gauss/tspdlib/docs/gc_tests.html)|[Nazlioglu, S., Soytas, U. & Gormus, A. (2019).](https://www.up.ac.za/media/shared/61/WP/wp_2019_54.zp176565.pdf) Oil prices and monetary policy in emerging markets: structural shifts in causal linkages”. Emerging Markets Finance and Trade. 55:1, 105-117.|Causality test with smooth structural breaks.|
|[`PDcaus_Fisher`](https://docs.aptech.com/gauss/tspdlib/docs/panel_fisher.html)|[Emirmahmutoglu, F., Kose, N. (2011).](https://econpapers.repec.org/article/eeeecmode/v_3a28_3ay_3a2011_3ai_3a3_3ap_3a870-876.htm) Testing for Granger causality in heterogeneous mixed panels, Economic Modelling 28 (2011) 870–876.|A simple Granger causality procedure based on Meta analysis in heterogeneous mixed panels.|
|[`PDcaus_Zhnc`](https://docs.aptech.com/gauss/tspdlib/docs/panel_zhnc.html)|[Dumitrescu, E., Hurlin, C. (2012).](https://econpapers.repec.org/article/eeeecmode/v_3a29_3ay_3a2012_3ai_3a4_3ap_3a1450-1460.htm) Testing for Granger non-causality in heterogeneous panels, Economic Modelling 29 (2012) 1450–1460.|A simple test of Granger (1969) non-causality for heterogeneous panel data models  based on the averaged individual Wald statistics of Granger non causality.|
|[`PDcaus_SURwald`](https://docs.aptech.com/gauss/tspdlib/docs/panel_surwald.html)|[Kónya, L. (2006).](https://econpapers.repec.org/article/eeeecmode/v_3a23_3ay_3a2006_3ai_3a6_3ap_3a978-992.htm) Exports and growth: Granger causality analysis on OECD countries with a panel data approach, Economic Modelling, 23 (6), pp. 978-992.|Panel data Granger causality approach based on SUR systems and Wald tests with country specific bootstrap critical values.|

### Cointegration Tests
|src file| Reference|Description|
|:------:|:---------|:----------|
|[`coint_egranger`](https://docs.aptech.com/gauss/tspdlib/docs/coint_egranger.html)|[Engle, R. F., and Granger, C. W. J. (1987).](https://pdfs.semanticscholar.org/0eb4/1ce10d763ce2cbe1006fae83d911b89d23a4.pdf)  Co-Integration and error correction: Representation, estimation and testing.  Econometrica,55, 251-276.|Engle-Granger cointegration test.|
|[`coint_cissano`](https://docs.aptech.com/gauss/tspdlib/docs/coint_cissano.html)|[ Carrion-i-Silvestre, J.L., Sanso, A. (2006).](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1468-0084.2006.00180.x) Tests the null of cointegration with structural breaks. Oxford Bulletin Economics and Statistics, 68(5), 623-646.|Lagrange Multiplier‐type statistic to test the null hypothesis of cointegration allowing for the possibility of a structural break.|
|[`coint_ghansen`](https://docs.aptech.com/gauss/tspdlib/docs/coint_ghansen.html)|[Gregory, A.W., Hansen, B. (1996a).](http://qed.econ.queensu.ca/working_papers/papers/qed_wp_862.pdf) Residual-based tests for cointegration in models with regime shifts. Journal of Econometrics, 70, 99-126.|Tests for the null of no cointegration against the alternative of cointegration with a structural break in the mean.|
|[`coint_ghansen`](https://docs.aptech.com/gauss/tspdlib/docs/coint_ghansen.html)|[Gregory, A.W., Hansen, B. (1996b).](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.365.7530&rep=rep1&type=pdf) Tests for cointegration in models with regime and trend shifts. Oxford Bulletin Economics and Statistics, 58(3), 555-560.|Tests for the null of no cointegration against the alternative of cointegration with a structural break in the mean and trend.|
|[`coint_hatemij`](https://docs.aptech.com/gauss/tspdlib/docs/coint_hatemij.html)|[Hatemi-J (2008).](https://s3.amazonaws.com/academia.edu.documents/40264549/Tests_for_cointegration_with_two_unknown_regime_shifts.pdf?response-content-disposition=inline%3B%20filename%3DTests_for_cointegration_with_two_unknown.pdf&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWOWYYGZ2Y53UL3A%2F20200123%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200123T180837Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d1f87edcee62230632fdd9b9f31e0c4cb707ddd0aaa156b62f49d705f8d5c847) Tests for cointegration with two unknown regime shifts with an application to financial market integration. Empirical Economics, 35, 497-505.|Tests for cointegration with two regime shifts.|
|[`coint_pouliaris`](https://docs.aptech.com/gauss/tspdlib/docs/coint_pouliaris.html)|[Phillips, P. C. B. , and Ouliaris, S. (1990)](http://finpko.faculty.ku.edu/myssi/FIN938/Phillips%20%26%20Ouliaris_Asymp%20Props%20of%20Resid%20Based%20Tests%20for%20Coint_Econometrica_1990.pdf) Asymptotic properties of residual-based tests for cointegration. Econometrica, 58 (1), pp. 165-193.| Asymptotic critical values for residual based tests for cointegration.|
|[`coint_shin`](https://docs.aptech.com/gauss/tspdlib/docs/coint_shin.html)|[Shin, Y. (1994).](https://pdfs.semanticscholar.org/1d89/f03a10a9c17a5c986a7ba5aaab52a68b6881.pdf) A residual-based test of the null of cointegration against the alternative of no cointegration. Econometric Theory, 10(1), 91-115.|A residual-based test for the null of cointegration using a structural single equation model.|
|[`coint_tsongetal`](https://docs.aptech.com/gauss/tspdlib/docs/coint_tsongetal.html)|[Tsong, C.C., Lee, C.F., Tsai, L.J., & Hu, T.C. (2016).](https://link.springer.com/article/10.1007/s00181-015-1028-6) The Fourier approximation and testing for the null of cointegration. Empirical Economics, 51(3), 1085-1113.| Test of the null of cointegration allowing for structural breaks of unknown form in deterministic trend by using the Fourier form.|
|[`coint_maki`](https://docs.aptech.com/gauss/tspdlib/docs/coint_maki.html)|[Maki, D. (2012).](https://www.sciencedirect.com/science/article/abs/pii/S0264999312001162) Tests for cointegration allowing for an unknown number of breaks. Economic Modelling, 29(5), 2011-2015.|Tests for cointegration with an unknown number of breaks.|


[Aptech Systems, Inc](https://www.aptech.com/)  
[![alt text][1.1]][1]
[![alt text][2.1]][2]
[![alt text][3.1]][3]

<!-- links to social media icons -->
[1.1]: https://www.aptech.com/wp-content/uploads/2019/02/fb.png (Visit Aptech Facebook)
[2.1]: https://www.aptech.com/wp-content/uploads/2019/02/gh.png (Aptech Github)
[3.1]: https://www.aptech.com/wp-content/uploads/2019/02/li.png (Find us on LinkedIn)

<!-- links to your social media accounts -->
[1]: https://www.facebook.com/GAUSSAptech/
[2]: https://github.com/aptech
[3]: https://linkedin.com/in/ericaclower
<!-- Please don't remove this: Grab your social icons from https://github.com/carlsednaoui/gitsocial -->
