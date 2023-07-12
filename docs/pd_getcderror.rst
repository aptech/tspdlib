
pd_getcderror
==============================================

Purpose
----------------

Procedure to error cross-section dependecy tests.

Format
----------------
.. function:: { LMbp, LM_adj, CDlm, CDlm_adj, CD } = pd_getcderror(y, x, N)
    :noindexentry:

    :param y: Long format dependent panel data.
    :type y: TNx1 vector

    :param x: Long format independent panel data.
    :type x: TNx1 vector
    
    :param N: Number of cross-sections.
    :type N: Scalar

    :return LMbp: LM test of Breusch and Pagan (1980).
    :rtype LMbp: Dataframe

    :return LM_adj: Bias corrected LM test of Pesaran et al. (2008).
    :rtype LM_adj: Dataframe

    :return CDlm: CDlm test of Pesaran (2004, 2020).
    :rtype CDlm: Dataframe

    :return CDlm_adj: Bias corrected CDlm test of Baltagi, Feng, Kao (2012).
    :rtype CDlm_adj: Dataframe

    :return CD: CD test of Pesaran (2004, 2020).
    :rtype CD: Dataframe

Examples
--------

::

  new;
  cls;
  library tspdlib_dv;

  // Number of cross-sections
  N = 9;      

  // Load data
  data = loadd(getGAUSSHome() $+ "pkgs/tspdlib/examples/pdcause.dat");

  // Call test
  { LMbp, LMadj , CDlm, CDlmadj, CD } = pd_getCDError(data[., "Y"], data[. , "X"], N);

Source
------

pd_cdtests.src


