# GAUSS Time Series and Panel data tests
Econometric package for Time Series and Panel Data Methods covering unit root, co-integration & causality tests. Extensive coverage of testing in the presence of [structural breaks](https://www.aptech.com/structural-breaks/).

The `tspdlib` library is written for GAUSS by [Saban Nazlioglu](mailto:snazlioglu@pau.edu.tr), Department of International Trade & Finance, Pamukkale University-Türkiye.

## Getting Started
### Prerequisites
The program files require a working copy of **GAUSS 19+**. Many tests can be run on earlier versions with some small revisions and users should contact erica@aptech.com for a modified library for earlier **GAUSS** versions.

### Installing
**GAUSS 20+**
The GAUSS Time Series and Panel data tests library can be installed and updated directly in GAUSS using the [GAUSS package manager](https://www.aptech.com/blog/gauss-package-manager-basics/).

**GAUSS 18+**
The GAUSS Time Series and Panel data tests can be easily installed using the [**GAUSS Application Installer**](https://www.aptech.com/support/installation/using-the-applications-installer-wizard/), as shown below:

1. Download the zipped folder `tspdlib_1.0.zip` from the [tspdlib release page](https://github.com/aptech/tspdlib/releases).
2. Select **Tools > Install Application** from the main **GAUSS** menu.  
![install wizard](images/install_application.png)  
3. Follow the installer prompts, making sure to navigate to the downloaded `tspdlib_1.0.zip`.
4. Before using the functions created by `tspdlib` you will need to load the newly created `tspdlib` library. This can be done in a number of ways:
  *   Navigate to the library tool view window and click the small wrench located next to the `tspdlib` library. Select `Load Library`.  
  ![load library](images/load_tspdlib.PNG)
  *  Enter `library tspdlib` in the program input/output window.
  *  Put the line `library tspdlib;` at the beginning of your program files.

>  Note: I have provided the individual files found in [`tspdlib_1.0.zip`](https://github.com/aptech/tspdlib/releases) for examination and review. However, installation should always be done using the [`tspdlib_1.0.zip` folder from the release page](https://github.com/aptech/tspdlib/releases) and the [**GAUSS Application Installer**](https://www.aptech.com/support/installation/using-the-applications-installer-wizard/).

### Examples
After installing the library the example files **examples > PDuroot.e** and **examples > TSuroot.e** will be found in your **GAUSS** home directory in the directory **pkgs > tspdlib >examples**. The example uses **GAUSS** datasets included in the **pkgs > tspdlib >examples** directory.

### Documentation
We have not yet developed detailed documentation about the library. However, you can find more information about the functions by looking at the function headers in the src codes.

![accessing GAUSS source files](images/tspdlib_src_file.png)

You can access these source codes through the library tool by expanding the tspdlib.lcg menu and clicking on the file name. The file will open in the program editor and you will be able to view the headers for each specific function.

## License
The author makes no performance guarantees. The `tspdlib` is available for public non-commercial use only.

## Author
For any bugs, please send e-mail to [Saban Nazlioglu](mailto:snazlioglu@pau.edu.tr) or [Erica Clower](mailto:erica@aptech.com).

## Supported
### Time Series Unit Root Tests
|src file| Reference|Description|
|:------:|:---------|:------------|
|adf| [Dickey, D.A., Fuller, W.A. (1979)](https://www.jstor.org/stable/2286348?seq=1#page_scan_tab_contents). Distribution of the estimators for autoregressive time series with a unit root. Journal of the American Statistical Society75, 427–431.| ADF unit root test.|
|adf_1br| [Zivot, E. & Andrews, W.K. (1992)](http://cba2.unomaha.edu/faculty/mwohar/WEB/links/Econometrics_papers/Zivot_Andrews.pdf). Further evidence on the great crash, the oil-price shock, and the unit root hypothesis. Journal of Business and Economic Statistics 10(3), 251-270. |ADF unit root test with a single break.|
|adf_2br|[Narayan, P.K. & Popp, S. (2010)](https://www.researchgate.net/publication/227345783_A_New_Unit_Root_Test_with_Two_Structural_Breaks_in_Level_and_Slope_at_Unknown_Time). A new unit root test with two structural breaks in level and slope at unknown time. Journal of Applied Statistics, 37:9, 1425-1438.|Unit root test with two unknown breaks.|
|lm| [Schmidt, P., & Phillips, P. C. (1992).](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1468-0084.1992.tb00002.x)  LM tests for a unit root in the presence of deterministic trends. Oxford Bulletin of Economics and Statistics, 54(3), 257-287.|LM test for a unit root.|
|lm_1br| [Lee, J. & Strazicich, Mark C. (2013)](https://econpapers.repec.org/article/eblecbull/eb-13-00296.htm). Minimum LM unit root test with one structural break. Economics Bulletin 33(4), 2483-2492.|LM unit root test with one structural break.|
|lm_2br| [Lee, J. & Strazicich, M.C. (2003)](https://libres.uncg.edu/ir/asu/f/Strazicich_Mark_2003_Minimum_Lagrange.pdf). Minimum Lagrange Multiplier unit toot test with two structural breaks. Review of Economics and Statistics 85(4), 1082-1089.|LM unit root test with two structural breaks.|
|kpss|[Kwiatkowski, D., Phillips, P. C., Schmidt, P., & Shin, Y (1992)](http://debis.deu.edu.tr/userweb//onder.hanedar/dosyalar/kpss.pdf). Testing the null hypothesis of stationarity against the alternative of a unit root: How sure are we that economic time series have a unit root?.  Journal of Econometrics, 4(1-3), 159-178.|KPSS test for the null of stationarity.|
|kpss_1br|[Kurozumi, E. (2002)](https://rmgsc.cr.usgs.gov/outgoing/threshold_articles/Kurozumi2002.pdf). Testing for stationarity with a break. Journal of Econometrics, 108(1), 63-99.|KPSS test for the null of stationarity with one structural break.|
|kpss_2br|[Carrion-i-Silvestre, J. Ll. & Sansó, A. (2007)](https://www.researchgate.net/publication/24064952_The_KPSS_test_with_two_structural_breaks). The KPSS test with two structural breaks. Spanish Economic Review, 9, 2, 105-127.|KPSS test for stationarity with two structural breaks.|
|fourier_adf|[Enders, W. & Lee, J. (2012)](https://ideas.repec.org/a/eee/ecolet/v117y2012i1p196-199.html). The flexible Fourier form and Dickey-Fuller type unit root tests. Economics Letters, 117, 196-199.|Dickey-Fuller unit root test with Flexible Fourier form structural breaks.
|fourier_lm|[Enders, W., and Lee, J. (2012)](http://www.time-series.net/yahoo_site_admin/assets/docs/Enders_Lee_Final_version_May_16_2011.39101351.pdf). A Unit Root Test Using a Fourier Series to Approximate Smooth Breaks. Oxford Bulletin of Economics and Statistics,74,4(2012),574-599.|LM unit root test with Flexible Fourier form structural breaks.
|fourier_kpss|[Becker, R., Enders, W., Lee, J. (2006)](https://econpapers.repec.org/article/blajtsera/v_3a27_3ay_3a2006_3ai_3a3_3ap_3a381-409.htm). A stationarity test in the presence of an unknown number of smooth breaks. Journal of Time Series Analysis, 27(3), 381-409.|KPSS stationarity test with Flexible Fourier form structural breaks. |
|fourier_gls|[Rodrigues, P. & Taylor, A.M.R. (2012)](https://www.bportugal.pt/sites/default/files/anexos/papers/wp200919.pdf). The flexible Fourier form and local GLS de-trending unit root tests. Oxford Bulletin of Economics and Statistics, 74(5), 736-759.|GLS detrended unit root test with Flexible Fourier form structural breaks. |
|gls|[Elliott, G., Rothenberg, T.J., Stock, J.H. (1996).](https://pdfs.semanticscholar.org/0ab9/d8b131e643d088b27c2e37fa6978b6424a89.pdf) Efficient tests for an autoregressive unit root. Econometrica 64,813–836.|GLS-ADF unit root test. |
|gls|[Ng, S., Perron, P. (2001).](http://www.columbia.edu/~sn2294/pub/ecta01.pdf)  Lag length selection and the construction of unit root tests with good size and power.  Econometrica 69,1519–1554.| Lag selection in unit root tests.|
|rals_adf|[Im, K. S., Lee, J., & Tieslau, M. A. (2014)](https://www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/snde-2016-0050.xml). More powerful unit root tests with non-normal errors. In Festschrift in Honor of Peter Schmidt (pp. 315-342). Springer New York.|RALS-ADF unit root test for non-normal errors.|
|rals_lm|[Meng, M., Im, K. S., Lee, J., & Tieslau, M. A. (2014)](https://www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/snde-2016-0050.xml). More powerful LM unit root tests with non-normal errors. In Festschrift in Honor of Peter Schmidt (pp. 343-357). Springer New York.|RALS-LM unit root test for non-normal errors.|
|qradf|[Koenker, R. & Xiao, Z. (2004)](https://www.jstor.org/stable/27590447?seq=1#page_scan_tab_contents). Unit root quantile autoregression inference, Journal of the American Statistical Association, 99(467), 775-787.| Quantile ADF unit root test.|

### Panel Data Unit Root Tests
|src file| Reference|
|:------:|:---------|
|pd_cips|[Pesaran, M.H. (2007).](https://onlinelibrary.wiley.com/doi/full/10.1002/jae.951) A simple unit root test in the presence of cross-section dependence. Journal of Applied Econometrics, 22 (2), 265-312.|
|pd_cips|[Westerlund, J., & Hosseinkouchack, M. (2016).](https://onlinelibrary.wiley.com/doi/abs/10.1111/obes.12127)  Modified CADF and CIPS Panel Unit Root Statistics with Standard Chi‐squared and Normal Limiting Distributions. Oxford Bulletin of Economics and Statistics, 78(3), 347-364.|
|pd_panic|[Bai, J. & Ng, S. (2004)](http://www.columbia.edu/~jb3064/papers/2004_A_panic_attack_on_unit_roots_and_cointegration.pdf). A PANIC attack on unit roots and cointegration. Econometrica, 72, 1127–78.|
|pd_panic|[Westerlund, J., & Larsson, R. (2009)](https://www.cambridge.org/core/journals/econometric-theory/article/note-on-the-pooling-of-individual-panic-unit-root-tests/7328B7103F2916320D17AFF28F1A2ACC#). A note on the pooling of individual PANIC unit root tests. Econometric Theory, 25(6), 1851-1868.|
|pd_panic|[Bai, J., & Ng, S. (2010)](http://www.columbia.edu/~jb3064/papers/2010_Panel_unit_root_tests_with_cross_section_dependence-a_further_investigation.pdf). Panel unit root tests with cross-section dependence: a further investigation. Econometric Theory, 26(4), 1088-1114.|
|pd_panic|[Reese, S., & Westerlund, J. (2016)](https://project.nek.lu.se/publications/workpap/papers/wp15_3.pdf). PANICCA: PANIC on Cross‐Section Averages. Journal of Applied Econometrics, 31(6), 961-981.|
|pd_panic|[Bai, J., & Ng, S. (2002)](http://www.econ.nyu.edu/user/baij/econometrica02.pdf). Determining the number of factors in approximate factor models. Econometrica, 70(1), 191-221.|
|pd_iltlevel|[Im, K., Lee, J., Tieslau, M. (2005)](https://pdfs.semanticscholar.org/794e/035e2af830b66f5d229cd444cbc8b34c3d83.pdf). Panel LM Unit-root Tests with Level Shifts, Oxford Bulletin of Economics and Statistics 67, 393–419.|
|pd_lttrend|[Lee, J., & Tieslau, M. (2017)](https://www.sciencedirect.com/science/article/pii/S0264999317316358). Panel LM unit root tests with level and trend shifts. Economic Modelling.|
|pd_nkarul|[Nazlioglu, S., & Karul, C. (2017)](https://econpapers.repec.org/article/eeeecmode/v_3a61_3ay_3a2017_3ai_3ac_3ap_3a181-192.htm). A panel stationarity test with gradual structural shifts: Re-investigate the international commodity price shocks. Economic Modelling, 61, 181-192.|

### Time Series and Panel Data Causality Tests
|src file| Reference|
|:------:|:---------|
|GC_tests|[Granger, C.W.J. (1969).](https://www.jstor.org/stable/1912791) Investigating causal relations by econometric models and cross-spectral methods. Econometrica 37, 424–438.|
|GC_tests|[Toda, H.Y. & Yamamoto, T. (1995).](https://econpapers.repec.org/article/eeeeconom/v_3a66_3ay_3a1995_3ai_3a1-2_3ap_3a225-250.htm) Statistical inference in vector autoregression with possibly integrated processes. Journal of Econometrics 66,225–250.|
|GC_tests|[Enders, W., & P. Jones. (2016).](https://ideas.repec.org/a/bpj/sndecm/v20y2016i4p399-419n3.html) Grain prices, oil prices, and multiple smooth breaks in a var. Studies in Nonlinear Dynamics & Econometrics 20 (4):399-419.|
|GC_tests|[Nazlioglu, S., Gormus, A. & Soytas, U. (2016).](https://ideas.repec.org/a/eee/eneeco/v60y2016icp168-175.html) Oil prices and real estate investment trusts (REITs): gradual-shift causality and volatility transmission analysis”. Energy Economics 60(1): 168-175.|
|GC_tests|[Gormus, A., Nazlioglu, S. & Soytas, U. (2018).](https://ideas.repec.org/a/eee/eneeco/v69y2018icp101-110.html) High-yield bond and energy markets. Energy Economics 69: 101-110.|
|GC_tests|[Nazlioglu, S., Soytas, U. & Gormus, A. (2019).](https://www.up.ac.za/media/shared/61/WP/wp_2019_54.zp176565.pdf) Oil prices and monetary policy in emerging markets: structural shifts in causal linkages”. Emerging Markets Finance and Trade. 55:1, 105-117.|
|PDcaus_Fisher|[Emirmahmutoglu, F., Kose, N. (2011).](https://econpapers.repec.org/article/eeeecmode/v_3a28_3ay_3a2011_3ai_3a3_3ap_3a870-876.htm) Testing for Granger causality in heterogeneous mixed panels, Economic Modelling 28 (2011) 870–876.|
|PDcaus_Zhnc|[Dumitrescu, E., Hurlin, C. (2012).](https://econpapers.repec.org/article/eeeecmode/v_3a29_3ay_3a2012_3ai_3a4_3ap_3a1450-1460.htm) Testing for Granger non-causality in heterogeneous panels, Economic Modelling 29 (2012) 1450–1460.|
|PDcaus_SURwald|[Kónya, L. (2006).](https://econpapers.repec.org/article/eeeecmode/v_3a23_3ay_3a2006_3ai_3a6_3ap_3a978-992.htm) Exports and growth: Granger causality analysis on OECD countries with a panel data approach, Economic Modelling, 23 (6), pp. 978-992.|

### Cointegration Tests
|src file| Reference|
|:------:|:---------|
|coint_egranger.src|[Engle, R. F., and Granger, C. W. J. (1987).](https://pdfs.semanticscholar.org/0eb4/1ce10d763ce2cbe1006fae83d911b89d23a4.pdf)  Co-Integration and error correction: Representation, estimation and testing.  Econometrica,55, 251-276.|
|coint_cissano.src|[ Carrion-i-Silvestre, J.L., Sanso, A. (2006).](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1468-0084.2006.00180.x) Tests the null of cointegration with structural breaks. Oxford Bulletin Economics and Statistics, 68(5), 623-646.|
|coint_ghansen.src|[Gregory, A.W., Hansen, B. (1996a).](http://qed.econ.queensu.ca/working_papers/papers/qed_wp_862.pdf) Residual-based tests for cointegration in models with regime shifts. Journal of Econometrics, 70, 99-126.|
|coint_ghansen.src|[Gregory, A.W., Hansen, B. (1996b).](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.365.7530&rep=rep1&type=pdf) Tests for cointegration in models with regime and trend shifts. Oxford Bulletin Economics and Statistics, 58(3), 555-560.|
|coint_hatemij.src|[Hatemi-J (2008).](https://s3.amazonaws.com/academia.edu.documents/40264549/Tests_for_cointegration_with_two_unknown_regime_shifts.pdf?response-content-disposition=inline%3B%20filename%3DTests_for_cointegration_with_two_unknown.pdf&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWOWYYGZ2Y53UL3A%2F20200123%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200123T180837Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d1f87edcee62230632fdd9b9f31e0c4cb707ddd0aaa156b62f49d705f8d5c847) Tests for cointegration with two unknown regime shifts with an application to financial market integration. Empirical Economics, 35, 497-505.|
|coint_pouliaris.src|[Phillips, P. C. B. , and Ouliaris, S. (1990)](http://finpko.faculty.ku.edu/myssi/FIN938/Phillips%20%26%20Ouliaris_Asymp%20Props%20of%20Resid%20Based%20Tests%20for%20Coint_Econometrica_1990.pdf) Asymptotic properties of residual-based tests for cointegration. Econometrica, 58 (1), pp. 165-193.|
|coint_shin.src|[Shin, Y. (1994).](https://pdfs.semanticscholar.org/1d89/f03a10a9c17a5c986a7ba5aaab52a68b6881.pdf) A residual-based test of the null of cointegration against the alternative of no cointegration. Econometric Theory, 10(1), 91-115.|
|coint_tsongetal.src|[Tsong, C.C., Lee, C.F., Tsai, L.J., & Hu, T.C. (2016).](https://link.springer.com/article/10.1007/s00181-015-1028-6) The Fourier approximation and testing for the null of cointegration. Empirical Economics, 51(3), 1085-1113.|
|coint_maki.src|[Maki, D. (2012).](https://www.sciencedirect.com/science/article/abs/pii/S0264999312001162) Tests for cointegration allowing for an unknow number of breaks. Economic Modelling, 29(5), 2011-2015.|


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
