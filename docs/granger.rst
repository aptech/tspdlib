gc_tests
==============================================

Purpose
----------------

Tests for Granger causality of specified variables. 

Format
----------------
.. function:: GC_out = granger(data, test[, pmax, ic, Nboot, vnames])
    :noindexentry:

    :param data: Data to be tested with k individual variables each in a separate column.
    :type data: Txk matrix

    :param test: Test option for Granger causality

          =========== =============================================
          0           Granger causality.
          1           Toda & Yamamoto
          2           Single Fourier-frequency Granger causality.
          4           Single Fourier frequency Toda & Yamamoto.
          5           Cumulative Fourier-frequency Toda & Yomamoto
          =========== =============================================

    :type test: Scalar

    :param pmax: Optional, maximum number of lags. Default = 8.
    :type pmax: Scalar

    :param ic: Optional, the information criterion used for choosing lags.

          =========== =====================
          1           Akaike.
          2           Schwarz.
          3           t-stat significance.
          =========== =====================

          Default = 2.
    :type ic: Scalar

    :param Nboot: Number of bootstrap replications.
    :type Nboot: Scalar

    :param vnames: Variable names. Default = dataframe variable names OR "X1"$|"X2".
    :type vnames: String array

    :return GC_out:  Results matrix containing Wald stat~P-values~Bootstrap P-values~Lags~Frequency
    :rtype GC_out: Kx5 Matrix


Examples
--------

::

  new;
  cls;

  library tspdlib;

  // Load data matrix
  GCdata = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/TScaus.dat");
  data   = ln(GCdata);

  // Toda & Yamamoto test
  test = 1;

  // Run test
  GC_out = granger(data, test);

Source
------

gctests.src
