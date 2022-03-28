panel_surwald
==============================================

Purpose
----------------

Testing for Granger causality in heterogeneous mixed panels with bootstrap critical values.

Format
----------------
.. function:: SURwald = Panel_SURwald(data, vnames, pmax, dmax, ic, Nboot)
    :noindexentry:

    :param data: Data to be tested with k individual variables each in a separate column.
    :type data: Txk matrix

    :param vnames: Variable names.
    :type vnames: String array

    :param pmax: Maximum number of lags.
    :type pmax: Scalar

    :param ic: The information criterion used for choosing lags.

          =========== =====================
          1           Akaike.
          2           Schwarz.
          3           t-stat significance.
          =========== =====================

          Default = 2.
    :type ic: Scalar

    :param Nboot: Number of bootstrap replications.
    :type Nboot: Scalar

    :param Ncross: Number of cross sections.
    :type Ncross: Scalar

    :return SURwald:  Panel SUR Wald statistics. Prints individual results and bootstrap critical values.
    :rtype SURwald: Scalar


Examples
--------

::

  new;
  library tspdlib;

  // Load panel data
  data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pdcause.dat");

  // Number of bootstrap replications
  Nboot = 1000;

  // Number of time periods
  T = 28;

  // Number of cross-sections
  Ncross = 9;

  // Maximum number of lags
  pmax = 3;

  // Information criterion;
  // 1 = Akaike, 2 = Schwarz
  ic = 2;

  // Variable names
  vnames = "y"$|"x";

  SURwald = Panel_SURwald(data, vnames, pmax, ic, Nboot, Ncross);

Source
------

pdcause_surwald.src

.. seealso:: Functions :func:`granger`, :func:`panel_fisher`, :func:`panel_zhnc`
