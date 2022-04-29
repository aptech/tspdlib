
bng_panicnew
==============================================

Purpose
----------------

Panel analysis of idiosyncratic and common components (PANIC) test of nonstationarity. Pooled Pa, Pb, and PMSB tests in Bai & Ng (2010).

Format
----------------
.. function:: { Pa_pc, Pb_pc, PMSB_pc } = bng_panicNew(y, model[, kmax, ic_factors])
    :noindexentry:

    :param y: Panel data to be tested.
    :type y: TxN matrix

    :param model: Model to be implemented.

        =========== ==============
        1           Constant.
        2           Constant and trend.
        =========== ==============

    :type model: Scalar

    :param kmax: Maximum number of factors. Maximum = Default = 5.
    :type kmax: Scalar

    :param ic_factors: Information Criterion for optimal number of factors. Default = 1.

        =========== ==============
        1           PCp criterion.
        2           ICp criterion.
        =========== ==============

    :type ic_factors: Scalar

    :return Pa_pc: Pa statistic based on principal components with N(0,1).
    :rtype Pa_pc: Scalar

    :return Pb_pc: Pb statistic based on principal components with N(0,1).
    :rtype Pb_pc: Scalar

    :return PMSB_pc: PMSB statistic based on principal components with N(0,1).
    :rtype PMSB_pc: Scalar


Examples
---------

::

  // Load date file
  y = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/PDe.dat");

  /*
  ** Default
  ** information criterion
  ** and maximum number of factors.
  */

  // Model with constant and trend
  model = 1;
  { Pa_pc, Pb_pc, PMSB_pc } = bng_panicNew(y, model);

Source
------

pd_panic.src

.. seealso:: Functions :func:`bng_panic`, :func:`jwr_panicca`, :func:`jwl_panicadj`
