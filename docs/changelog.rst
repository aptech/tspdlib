==========
Change Log
==========

The following is a list of changes from the previous version of tspdlib.

2.1.0
-----
#. Bug Fix: Fixed incorrect printing of model type for coint_maki.
#. Bug Fix: Fix critical values printing bug in rals_lm_break.
#. Bug Fix: Fix printing error for pd_lttrend and pd_iltlevel for case with no date vector.
#. Added examples:
      - pd_getCDError.e
      - rals_lm_breaks.e
#. Added function:
      - pd_getCDError

2.0.1
-----
#. Bug Fix: Fixed printing of model type.
#. Add critical values for coint_maki.
#. Update printing style for coint_maki

2.0.0
-----
#. Added response surface critical values in ADF, GLS, LM, and KPSS tests.
#. Added innovational outlier and additive outlier options for Zivot & Andrews unit root tests.
#. Bug Fix: Optimal lag selection in adf_1br, adf_2br, lm_1br, fourier_adf, fourier_lm, and fourier_gls.
#. Add standardized output printing.
#. New procedures:
      - gls_1br - GLS unit root test with one break.
      - gls_2br - GLS unit root tests with two breaks.
      - RALSLM_breaks - RALS-LM unit root tests with one and two breaks.
      - fixed_T_panel - Fixed T unit root tests.
      - _get_cd_error - Error-cross section dependence tests.
      - ADF_1break_est - ADF break with 1 break unit root tests with regression coefficients returned.
      - ADF_2break_est - ADF break with 2 break unit root tests with regression coefficients returned.
      - granger - Granger causality function with optional arguments.
      - pdlm - PD level and trend break test with optional arguments.
      - quantileADF - quantile ADF procedure with option arguments.
#. Update ADF_1br.e to accommodate new outlier model input.
#. Update all procedure to use optional arguments for parameters and set defaults for all optional arguments.
#. Add new dataframe datasets with date types.
#. Update all structural break accommodating tests to be compatible with date types.
#. Add automatic date type detection.
#. Add printing of test details.
#. Add printing of test conclusions.
#. New examples:
    - gls_1br.e
    - gls_2br.e
    - pdlm.e
    - granger.e
    - quantileADF.e

1.1.1
-----
#.  Added new example files:
    - lm.e
    - lmkpss.e
    - mgls.e
#. Fixed minor formatting in the function headers
#. Add Wald statistics and corresponding bootstrap critical values for the cases with more lags to PDcaus_SURwald

1.1.0
-----
#. BNG_PANICnew model inputs changed to 1 for intercept, 2 for intercept and trend.
#. Change outputs from adf procedure to include tstat, p-value, and critical value.
#. Add critical values to output from dfgls procedure.
#. Add critical values to output from erspt procedure.
#. Add bandwidth length to required inputs from erspt procedure.
#. Add bandwidth length to required inputs for Fourier_kpss procedure.
#. JWL_panic model inputs changed to 1 for intercept, 2 for intercept and trend.
#. Add bandwidth length for spectral window to required inputs for kpss_1break and kpss_2break procedures.
#. Add bandwidth length for spectral window to required inputs for mgls procedure.
#. Add critical values to output from mgls procedure.
#. Add bandwidth length for spectral window to required inputs for pp procedure.
#. Add critical values to output from pp procedure.
#. Add the following functions:
    - coint_cissano
    - coint_egranger
    - coint_ghansen
    - coint_hatemiJ
    - coint_shin
    - coint_tsongetal
    - PDcaus_Fisher
    - PDcaus_SURwald
    - PDcaus_Zhnc
    - PD_cips
    - GCtest
