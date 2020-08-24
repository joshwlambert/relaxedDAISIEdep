test_that("calc_rr_approach_cr runs silently and produces correct output", {
  delta_loglik <- calc_rr_approach_cr(parameter = "cladogenesis",
                                      clade = "lineage")
  testthat::expect_length(delta_loglik, 2)
  testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
  testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
  testthat::expect_equal(
    delta_loglik$delta_likelihood,
    c(6.745636e-06, 2.686875e-05, 5.999232e-05, 1.053927e-04, 1.619278e-04,
      2.280367e-04, 3.018335e-04, 3.812652e-04, 4.642815e-04, 5.489726e-04,
      6.336574e-04, 7.169236e-04, 7.976313e-04, 8.748952e-04, 9.480537e-04,
      1.016636e-03, 1.080330e-03, 1.138949e-03, 1.192410e-03, 1.240710e-03,
      1.283907e-03, 1.322108e-03, 1.355455e-03, 1.384116e-03, 1.408276e-03,
      1.428136e-03, 1.443902e-03, 1.455784e-03, 1.463994e-03, 1.468742e-03,
      1.470234e-03, 1.468673e-03, 1.464254e-03, 1.457169e-03, 1.447598e-03,
      1.435718e-03, 1.421695e-03, 1.405689e-03, 1.387853e-03, 1.368330e-03,
      1.347256e-03, 1.324761e-03, 1.300966e-03, 1.275985e-03, 1.249927e-03,
      1.222893e-03, 1.194978e-03, 1.166271e-03, 1.136855e-03, 1.106810e-03))
})
