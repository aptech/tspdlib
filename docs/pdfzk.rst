
pdfzk
==============================================

Purpose
----------------

Computes the panel stationary test with flexible Fourier form structural breaks.

Format
----------------
.. function:: { Nkpss, Fzk, pval } = pdfzk(y, model, k [, varm])
    :noindexentry:

    :param y: Panel data to be tested.
    :type y: NxT matrix

    :param model: Model to be implemented.

          =========== ============================
          1           Level shift model.
          2           Level and trend shift model.
          =========== ============================

    :type model: Scalar

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

    :return Nkpss: KPSS statistic with common factor for each cross-section.
    :rtype Nkpss: Scalar

    :return FZK: Panel stationarity statistic with N(0,1).
    :rtype FZK: Scalar

    :return pval: p-value of FZk.
    :rtype pval: Scalar

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", 
                                ". + date($Date, '%b-%y')");

  // Panel stationarity test with level shifts
  model = 1;
  { Nkpss, FZk, pval } = PDfzk(y, model, 4);

Source
------

pd_nkarul.src

.. seealso:: Functions :func:`pdlm`, :func:`pd_kpss`
