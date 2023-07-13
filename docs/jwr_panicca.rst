
jwr_panicca
==============================================

Purpose
----------------

Computes the Pooled Pa, Pb, and PMSB tests in Westerlund & Reese (2016) using panel analysis of idiosyncratic and common components (PANIC) test of nonstationarity. 

Format
----------------
.. function:: { Pa_ca, Pb_ca, PMSB_ca } = jwr_panicca(y, model)
    :noindexentry:

    :param y: Panel data to be tested.
    :type y: TxN matrix

    :param model: Model to be implemented.

        =========== ==============
        1           Constant.
        2           Constant and trend.
        =========== ==============

    :type model: Scalar

    :return Pa_ca: Pa statistic based on cross-section averages with N(0,1).
    :rtype Pa_ca: Scalar

    :return Pb_ca: Pb statistic based on cross-section averages with N(0,1).
    :rtype Pb_ca: Scalar

    :return PMSB_ca: PMSB statistic based on cross-section averages with N(0,1).
    :rtype PMSB_ca: Scalar

Examples
---------

::

  library tspdlib;

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/PDe.dat");

  /*
  ** Model with constant
  */
  model = 1;
  { Pa_ca, Pb_ca, PMSB_ca } = jwr_panicca(y, model);

Source
------

pd_panic.src

.. seealso:: Functions :func:`bng_panic`, :func:`jwl_panicadj`, :func:`bng_panicnew`
