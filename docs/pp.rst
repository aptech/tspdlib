
pp
==============================================

Purpose
----------------

Computes the Phillips and Perron unit root test (Perron, P., & Ng, S. (1996)).

Format
----------------
.. function:: { Zt, Za, cvZt, cvZa } = PP(y, model[, bwl[, varm]])
    :noindexentry:

    :param y: Time series data to be tested.
    :type y: Nx1 matrix

    :param model: Model to be implemented.

        =========== ==============
        0           No constant or trend.
        1           Constant.
        2           Constant and trend.
        =========== ==============

    :type model: Scalar

    :param bwl: Optional, bandwidth for the spectral window. Default = round(4 * (T/100)^(2/9)).
    :type  bwl: Scalar

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

    :return Zt: Phillips and Perron Zt test statistic.
    :rtype Zt: Scalar

    :return Za: Phillips and Perron Za test statistic.
    :rtype Za: Scalar

    :return cvZt: 1%, 5%, and 10% critical values for PP :math:`Zt`-stat.
    :rtype cvZt: Vector

    :return cvZa: 1%, 5%, and 10% critical values for PP :math:`Zt`-stat.
    :rtype cvZa: Vector

Examples
--------

::

  library tspdlib;

  // Load date file
  y = loadd(__FILE_DIR $+ "TSe.dat");

  // No deterministic component
  model = 0;
  { Zt, Za, cvZt, cvZa } = PP(y, model);

Source
------

pp.src

.. seealso:: Functions :func:`adf`, :func:`lmkpss`
