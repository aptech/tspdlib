# GAUSS Time Series and Panel data tests
Econometric package for Time Series and Panel Data Methods covering unit root, co-integration & causality tests. Extensive coverage of testing in the presence of [structural breaks](https://www.aptech.com/structural-breaks/).

The `tspdlib` library is written for GAUSS by Saban Nazlioglu (snazlioglu@pau.edu.tr), Department of International Trade & Finance, Pamukkale University-Türkiye.

## Getting Started
### Prerequisites
The program files require a working copy of **GAUSS 19+**. Many tests can be run on earlier versions with some small revisions and users should contact erica@aptech.com for a modified library for earlier **GAUSS** versions.

### Installing
The GAUSS Time Series and Panel data tests can be easily installed using the **GAUSS Application Installer**, as shown below:

1. Download the zipped folder `tspdlib.zip`.
2. Select **Tools > Install Application** from the main **GAUSS** menu.  
![install wizard](images/install_application.png)  
3. Follow the installer prompts, making sure to navigate to the downloaded `tspdlib.zip`.
4. Before using the functions created by `tspdlib` you will need to load the newly created `tspdlib` library. This can be done in a number of ways:
  *   Navigate to the library tool view window and click the small wrench located next to the `tspdlib` library. Select `Load Library`.  
  ![load library](images/load_tspdlib.PNG)
  *  Enter `library tspdlib` in the program input/output window.
  *  Put the line `library tspdlib;` at the beginning of your program files.

  Note: I have provided the individual files found in `tspdlib.zip` for examination and review. However, installation should always be done using the `tspdlib.zip` folder and the **GAUSS Application Installer**.

### Examples
After installing the library the example files **examples > PDuroot.e** and **examples > TSuroot.e** will be found in your **GAUSS** home directory in the directory **pkgs > tspdlib >examples**. The example uses **GAUSS** datasets included in the **pkgs > tspdlib >examples** directory.

### Documentation
We have not yet developed detailed documentation about the library. However, you can find more information about the functions by looking at the function headers in the src codes.

![accessing GAUSS source files](images/tspdlib_src_file.png)

You can access these source codes through the library tool by expanding the tspdlib.lcg menu and clicking on the file name. The file will open in the program editor and you will be able to view the headers for each specific function.
## License
The author makes no performance guarantees. The `tspdlib` is available for public non-commercial use only.

## Author
For any bugs, please send e-mail to Saban Nazlioglu at snazlioglu@pau.edu.tr or Erica Clower at erica@aptech.com.

## Supported
### Time Series Unit Root Tests
|src file| Reference|
|:------:|:---------|
|zandrews| [Zivot, E. & Andrews, W.K. (1992)](http://cba2.unomaha.edu/faculty/mwohar/WEB/links/Econometrics_papers/Zivot_Andrews.pdf). Further evidence on the great crash, the oil-price shock, and the unit root hypothesis. Journal of Business and Economic Statistics 10(3), 251-270. |
|npopp|[Narayan, P.K. & Popp, S. (2010)](https://www.researchgate.net/publication/227345783_A_New_Unit_Root_Test_with_Two_Structural_Breaks_in_Level_and_Slope_at_Unknown_Time). A new unit root test with two structural breaks in level and slope at unknown time. Journal of Applied Statistics, 37:9, 1425-1438.|
|lstrazicich1| [Lee, J. & Strazicich, Mark C. (2013)](https://econpapers.repec.org/article/eblecbull/eb-13-00296.htm). Minimum LM unit root test with one structural break. Economics Bulletin 33(4), 2483-2492.|
|lstrazicich2| [Lee, J. & Strazicich, M.C. (2003)](https://libres.uncg.edu/ir/asu/f/Strazicich_Mark_2003_Minimum_Lagrange.pdf). Minimum Lagrange Multiplier unit toot test with two structural breaks. Review of Economics and Statistics 85(4), 1082-1089.|
|kurozumi|[Kurozumi, E. (2002)](https://rmgsc.cr.usgs.gov/outgoing/threshold_articles/Kurozumi2002.pdf). Testing for stationarity with a break. Journal of Econometrics, 108(1), 63-99.|
|cissanso|[Carrion-i-Silvestre, J. Ll. & Sansó, A. (2007)](https://www.researchgate.net/publication/24064952_The_KPSS_test_with_two_structural_breaks). The KPSS test with two structural breaks. Spanish Economic Review, 9, 2, 105-127.|
|eleeFadf|[Enders, W. & Lee, J. (2012)](https://ideas.repec.org/a/eee/ecolet/v117y2012i1p196-199.html). The flexible Fourier form and Dickey-Fuller type unit root tests. Economics Letters, 117, 196-199.|
|eleeFlm|[Enders, W., and Lee, J. (2012)](http://www.time-series.net/yahoo_site_admin/assets/docs/Enders_Lee_Final_version_May_16_2011.39101351.pdf). A Unit Root Test Using a Fourier Series to Approximate Smooth Breaks. Oxford Bulletin of Economics and Statistics,74,4(2012),574-599.|
|belFkpss|[Becker, R., Enders, W., Lee, J. (2006)](https://econpapers.repec.org/article/blajtsera/v_3a27_3ay_3a2006_3ai_3a3_3ap_3a381-409.htm). A stationarity test in the presence of an unknown number of smooth breaks. Journal of Time Series Analysis, 27(3), 381-409.|
|rtaylorFgls|[Rodrigues, P. & Taylor, A.M.R. (2012)](https://www.bportugal.pt/sites/default/files/anexos/papers/wp200919.pdf). The flexible Fourier form and local GLS de-trending unit root tests. Oxford Bulletin of Economics and Statistics, 74(5), 736-759.|
|rals_adf|[Im, K. S., Lee, J., & Tieslau, M. A. (2014)](https://www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/snde-2016-0050.xml). More powerful unit root tests with non-normal errors. In Festschrift in Honor of Peter Schmidt (pp. 315-342). Springer New York.|
|rals_lm|[Meng, M., Im, K. S., Lee, J., & Tieslau, M. A. (2014)](https://www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/www.degruyter.com/view/j/snde.ahead-of-print/snde-2016-0050/snde-2016-0050.xml). More powerful LM unit root tests with non-normal errors. In Festschrift in Honor of Peter Schmidt (pp. 343-357). Springer New York.|
|qradf|[Koenker, R. & Xiao, Z. (2004)](https://www.jstor.org/stable/27590447?seq=1#page_scan_tab_contents). Unit root quantile autoregression inference, Journal of the American Statistical Association, 99(467), 775-787.|

### Panel Data Unit Root Tests
|src file| Reference|
|:------:|:---------|
|pd_panic|[Bai, J. & Ng, S. (2004)](http://www.columbia.edu/~jb3064/papers/2004_A_panic_attack_on_unit_roots_and_cointegration.pdf). A PANIC attack on unit roots and cointegration. Econometrica, 72, 1127–78.|
|pd_panic|[Westerlund, J., & Larsson, R. (2009)](https://www.cambridge.org/core/journals/econometric-theory/article/note-on-the-pooling-of-individual-panic-unit-root-tests/7328B7103F2916320D17AFF28F1A2ACC#). A note on the pooling of individual PANIC unit root tests. Econometric Theory, 25(6), 1851-1868.|
|pd_panic|[Bai, J., & Ng, S. (2010)](http://www.columbia.edu/~jb3064/papers/2010_Panel_unit_root_tests_with_cross_section_dependence-a_further_investigation.pdf). Panel unit root tests with cross-section dependence: a further investigation. Econometric Theory, 26(4), 1088-1114.|
|pd_panic|[Reese, S., & Westerlund, J. (2016)](https://project.nek.lu.se/publications/workpap/papers/wp15_3.pdf). PANICCA: PANIC on Cross‐Section Averages. Journal of Applied Econometrics, 31(6), 961-981.|
|pd_panic|[Bai, J., & Ng, S. (2002)](http://www.econ.nyu.edu/user/baij/econometrica02.pdf). Determining the number of factors in approximate factor models. Econometrica, 70(1), 191-221.|
|pd_iltlevel|[Im, K., Lee, J., Tieslau, M. (2005)](https://pdfs.semanticscholar.org/794e/035e2af830b66f5d229cd444cbc8b34c3d83.pdf). Panel LM Unit-root Tests with Level Shifts, Oxford Bulletin of Economics and Statistics 67, 393–419.|
|pd_lttrend|[Lee, J., & Tieslau, M. (2017)](https://www.sciencedirect.com/science/article/pii/S0264999317316358). Panel LM unit root tests with level and trend shifts. Economic Modelling.|
|pd_nkarul|[Nazlioglu, S., & Karul, C. (2017)](https://econpapers.repec.org/article/eeeecmode/v_3a61_3ay_3a2017_3ai_3ac_3ap_3a181-192.htm). A panel stationarity test with gradual structural shifts: Re-investigate the international commodity price shocks. Economic Modelling, 61, 181-192.|
