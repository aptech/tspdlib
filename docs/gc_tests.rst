gc_tests
==============================================

Purpose
----------------

LM unit root test with Flexible Fourier form structural breaks.

Format
----------------
.. function:: GC_out = GC_tests(data, vnames, pmax, ic, test, Nboot)
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

    :type ic: Scalar

    :param test: Test option for Granger causality
    =========== =============================================
    0           Granger causality.
    1           Toda & Yamamoto
    2           Single Fourier-frequency Granger causality.
    4           Single Fourier frequency Toda & Yamamoto.
    5           Cumulative Fourier-frequency Toda & Yomamoto
    =========== =============================================
    :type ic: Scalar

    :param Nboot: Number of bootstrap replications.
    :type Nboot: Scalar

    :return GC_out:  Results matrix containing Wald stat~P-values~Bootstrap P-values~Lags~Frequency
    :rtype GC_out: Kx5 Matrix


Examples
--------

::

  new;
  cls;

  library tspdlib;

  // Number of bootstrap replications
  Nboot= 1000;

  // Number of observations
  T  = 188;

  // Number of lags in VAR model
  pmax = 12;

  // Information criterion
  // 1 = Akaike;
  // 2 = Schwarz;
  ic   = 1;

  // Set to perform Granger Causality
  test = 0;

  // Load data matrix
  GCdata = loadd(__FILE_DIR $+ "TScaus.dat");
  data   = ln(GCdata);

  // Variable names
  vnames = "y1"$|"y2"$|"y3"$|"y4";

  // Toda & Yamamoto test
  test = 1;

  GC_out = GC_tests(data, vnames, pmax, ic, test, Nboot);

Source
------

gctests.src

.. seealso::
