panel_fisher
==============================================

Purpose
----------------

Computes tests for Granger causality in heterogeneous mixed panels with bootstrap critical values.

Format
----------------
.. function:: Fisher = Panel_Fisher(data, vnames, pmax, dmax, ic, Nboot)
    :noindexentry:

    :param data: Data to be tested with k individual variables each in a separate column.
    :type data: Txk matrix

    :param vnames: Variable names.
    :type vnames: String array

    :param pmax: Maximum number of lags.
    :type pmax: Scalar

    :param dmax: Maximum integration degree of variables.
    :type dmax: Scalar

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

    :return Fisher:  Panel Fisher statistics. Prints individual results and bootstrap critical values.
    :rtype Fisher: Scalar


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

  // Number of integration
  dmax = 1;

  // Information criterion;
  // 1 = Akaike, 2 = Schwarz
  ic = 2;

  // Variable names
  vnames = "y"$|"x";

  Fisher = Panel_Fisher(data, vnames, pmax, dmax, ic, Nboot, Ncross);

Source
------

pdcause_fisher.src

.. seealso:: Functions :func:`granger`, :func:`panel_zhnc`, :func:`panel_surwald`
