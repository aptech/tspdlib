
pdfzk
==============================================

Purpose
----------------

Computes the panel stationary test with gradual shifts.

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

  new;
  cls;
  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pd_full.csv", "Y1 + Y2 + Y3 + Y4 + Y5 + Y6 + Y7 + Y8 + Y9 + Y10 + Y11 + Y12 + Y13 + Y14 + Y15 + Y16 + Y17 + Y18 + Y19 + Y20 + Y21 + Y22 + Y23 + Y24 + date($Date, '%b-%y')");

  // Panel stationarity test with level shifts
  model = 1;
  { Nkpss, FZk, pval } = PDfzk(y, model, 4);

Source
------

pd_nkarul.src

.. seealso:: Functions :func:`pdlm`
