context("calc_rr_approach_cr")

test_that("calc_rr_approach_cr cladogenesis lineage produces correct output", {
  delta_loglik <- calc_rr_approach_cr(parameter = "cladogenesis",
                                      clade = "lineage")
  testthat::expect_length(delta_loglik, 2)
  testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
  testthat::expect_true(is.numeric(delta_loglik$sd))
  testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
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

test_that("calc_rr_approach_cr extinction lineage produces correct output", {
  delta_loglik <- calc_rr_approach_cr(parameter = "extinction",
                                      clade = "lineage")
  testthat::expect_length(delta_loglik, 2)
  testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
  testthat::expect_true(is.numeric(delta_loglik$sd))
  testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
  testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
  testthat::expect_equal(
    delta_loglik$delta_likelihood,
    c(2.328006e-05, 9.266425e-05, 2.067158e-04, 3.629248e-04, 5.577890e-04,
      7.871187e-04, 1.046443e-03, 1.331368e-03, 1.637807e-03, 1.962099e-03,
      2.301032e-03, 2.651825e-03, 3.012080e-03, 3.379734e-03, 3.753008e-03,
      4.130365e-03, 4.510471e-03, 4.892164e-03, 5.274431e-03, 5.656382e-03,
      6.037237e-03, 6.416311e-03, 6.793001e-03, 7.166780e-03, 7.537183e-03,
      7.903805e-03, 8.266295e-03, 8.624347e-03, 8.977700e-03, 9.326131e-03,
      9.669451e-03, 1.000750e-02, 1.034016e-02, 1.066733e-02, 1.098892e-02,
      1.130489e-02, 1.161520e-02, 1.191982e-02, 1.221876e-02, 1.251202e-02,
      1.279963e-02, 1.308162e-02, 1.335804e-02, 1.362893e-02, 1.389436e-02,
      1.415439e-02, 1.440910e-02, 1.465855e-02, 1.490284e-02, 1.514204e-02))
})

# test_that("calc_rr_approach_cr carrying_capacity lineage produces correct
#           output", {
#   delta_loglik <- calc_rr_approach_cr(parameter = "carrying_capacity",
#                                       clade = "lineage")
#   testthat::expect_length(delta_loglik, 2)
#   testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
#   testthat::expect_true(is.numeric(delta_loglik$sd))
#   testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
#   testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
#   testthat::expect_equal(
#     delta_loglik$delta_likelihood,
#     c(1.336006e-09, 5.525438e-08, 1.243267e-07, 2.210361e-07, 3.453906e-07,
#       4.974006e-07, 6.770788e-07, 8.844403e-07, 1.119502e-06, 1.382285e-06,
#       1.672809e-06, 1.991100e-06, 2.337183e-06, 2.711087e-06, 3.112844e-06,
#       3.542487e-06, 4.000051e-06, 4.485573e-06, 4.999094e-06, 5.540656e-06,
#       6.110303e-06, 6.708081e-06, 7.334040e-06, 7.988230e-06, 8.670704e-06,
#       9.381517e-06, 1.012073e-05, 1.088839e-05, 1.168457e-05, 1.250933e-05,
#       1.336274e-05, 1.424486e-05, 1.515576e-05, 1.609552e-05, 1.706420e-05,
#       1.806188e-05, 1.908865e-05, 2.014457e-05, 2.122973e-05, 2.234421e-05,
#       2.348810e-05, 2.466147e-05, 2.586443e-05, 2.709706e-05, 2.835945e-05,
#       2.965168e-05, 3.097387e-05, 3.232610e-05, 3.370847e-05, 3.512108e-05))
# })

test_that("calc_rr_approach_cr anagenesis lineage produces correct output", {
  delta_loglik <- calc_rr_approach_cr(parameter = "anagenesis",
                                      clade = "lineage")
  testthat::expect_length(delta_loglik, 2)
  testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
  testthat::expect_true(is.numeric(delta_loglik$sd))
  testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
  testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
  testthat::expect_equal(
    delta_loglik$delta_likelihood,
    c(1.336006e-09, 5.305746e-09, 1.179795e-08, 2.063867e-08, 3.160615e-08,
      4.444721e-08, 5.889432e-08, 7.467860e-08, 9.154141e-08, 1.092417e-07,
      1.275609e-07, 1.463046e-07, 1.653037e-07, 1.844130e-07, 2.035103e-07,
      2.224930e-07, 2.412763e-07, 2.597945e-07, 2.779930e-07, 2.958324e-07,
      3.132727e-07, 3.302978e-07, 3.468816e-07, 3.630320e-07, 3.787290e-07,
      3.939766e-07, 4.087729e-07, 4.231239e-07, 4.370409e-07, 4.505261e-07,
      4.635948e-07, 4.762268e-07, 4.884742e-07, 5.003361e-07, 5.118190e-07,
      5.229390e-07, 5.336631e-07, 5.440896e-07, 5.541771e-07, 5.639229e-07,
      5.734292e-07, 5.825489e-07, 5.914524e-07, 6.000508e-07, 6.083768e-07,
      6.164827e-07, 6.242838e-07, 6.319105e-07, 6.392474e-07, 6.463835e-07))
})

# test_that("calc_rr_approach_cr cladogenesis radiation produces correct
#           output", {
#   delta_loglik <- calc_rr_approach_cr(parameter = "cladogenesis",
#                                       clade = "radiation")
#   testthat::expect_length(delta_loglik, 2)
#   testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
#   testthat::expect_true(is.numeric(delta_loglik$sd))
#   testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
#   testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
#   testthat::expect_equal(
#     delta_loglik$delta_likelihood,
#     c(1.336006e-09, 5.305746e-09, 1.179795e-08, 2.063867e-08, 3.160615e-08,
#       4.444721e-08, 5.889432e-08, 7.467860e-08, 9.154141e-08, 1.092417e-07,
#       1.275609e-07, 1.463046e-07, 1.653037e-07, 1.844130e-07, 2.035103e-07,
#       2.224930e-07, 2.412763e-07, 2.597945e-07, 2.779930e-07, 2.958324e-07,
#       3.132727e-07, 3.302978e-07, 3.468816e-07, 3.630320e-07, 3.787290e-07,
#       3.939766e-07, 4.087729e-07, 4.231239e-07, 4.370409e-07, 4.505261e-07,
#       4.635948e-07, 4.762268e-07, 4.884742e-07, 5.003361e-07, 5.118190e-07,
#       5.229390e-07, 5.336631e-07, 5.440896e-07, 5.541771e-07, 5.639229e-07,
#       5.734292e-07, 5.825489e-07, 5.914524e-07, 6.000508e-07, 6.083768e-07,
#       6.164827e-07, 6.242838e-07, 6.319105e-07, 6.392474e-07, 6.463835e-07))
# })
