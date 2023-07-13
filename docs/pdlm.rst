
pdlm
==============================================

Purpose
----------------

Computes panel data LM tests with 0, 1, or 2 breaks in the level or level and trend.

Format
----------------
.. function:: { Nlm, Ntb, Np, PD_lm, cvPDLM } = PDLM(y, model[, nbreak, pmax, ic, trimm])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented. Default = 0.

        =========== =============================
        1           Level break model.
        2           Level and trend break model.
        =========== =============================

    :type model: Scalar

    :param nbreak: Optional, number of breaks.

        =========== =============================
        0           No break test.
        1           One break test.
        2           Two break tests.
        =========== =============================

        Default = 0.

    :type  nbreak: Scalar

    :param pmax: Optional, maximum number of lags. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags. Default = 3.

        =========== ======================
        1           Akaike.
        2           Schwarz.
        3           t-stat significance.
        =========== ======================

    :type ic: Scalar

    :param trimm: Optional, trimming rate. Default = 0.10.
    :type trimm: Scalar

    :return Nlm: Minimum test statistic for each cross-section.
    :rtype Nlm: Vector

    :return Ntb: Location of break(s) for each cross-section.
    :rtype Ntb: Vector

    :return Np: Number of lags selected by choosen information criterion for each cross-section.
    :rtype Np: Vector

    :return PD_lm: Panel LM statistic with N(0,1).
    :rtype PD_lm: Scalar

    :return pval: P-value of the panel LM statistic.
    :rtype pval: Scalar

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv",
                                ". + date($Date, '%b-%y')");

  // Run panel LM test with level shifts
  // No breaks
  model = 1;

  // No breaks
  { Nlm, Ntb, Np, PD_lm, pval } = PDLM(y, model);

Source
------

pd_iltlevel.src

.. seealso:: Functions :func:`pd_kpss`, :func:`pdfzk`
