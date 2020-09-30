context("calc_rr_approach_cr")

test_that("calc_rr_approach_cr cladogenesis lineage produces correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    delta_loglik <- calc_rr_approach_cr(parameter = "cladogenesis",
                                        clade = "lineage")
    testthat::expect_length(delta_loglik, 2)
    testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
    testthat::expect_true(is.numeric(delta_loglik$sd))
    testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
    testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
    testthat::expect_equal(
      delta_loglik$delta_likelihood,
      c(6.74563638248735e-06, 2.68687479957541e-05, 5.99923220708258e-05,
        1.05392436354875e-04, 1.61927809071722e-04, 2.28036700012076e-04,
        3.01833497541738e-04, 3.81265240429296e-04, 4.64281505228360e-04,
        5.48972647626408e-04, 6.33672438710989e-04, 7.16923544959458e-04,
        7.97631508647756e-04, 8.74894066083293e-04, 9.48055421978788e-04,
        1.01664176191217e-03, 1.08034846356316e-03, 1.13890756214378e-03,
        1.19236170394500e-03, 1.24068045625723e-03, 1.28390706305205e-03,
        1.32210849305917e-03, 1.35549059917589e-03, 1.38411582459519e-03,
        1.40827645843643e-03, 1.42813455370528e-03, 1.44389849631354e-03,
        1.45578391569111e-03, 1.46399381732864e-03, 1.46874157576485e-03,
        1.47023390667075e-03, 1.46867283025102e-03, 1.46425458883979e-03,
        1.45716970315452e-03, 1.44759815619153e-03, 1.43571757972505e-03,
        1.42169453782784e-03, 1.40568871731453e-03, 1.38785206445376e-03,
        1.36832881026377e-03, 1.34725611023405e-03, 1.32476084027624e-03,
        1.30096565094115e-03, 1.27598516086142e-03, 1.24992721326527e-03,
        1.22289313598448e-03, 1.19497802011630e-03, 1.16627099582348e-03,
        1.13685475340642e-03, 1.10680964046493e-03))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("calc_rr_approach_cr extinction lineage produces correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    delta_loglik <- calc_rr_approach_cr(parameter = "extinction",
                                        clade = "lineage")
    testthat::expect_length(delta_loglik, 2)
    testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
    testthat::expect_true(is.numeric(delta_loglik$sd))
    testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
    testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
    testthat::expect_equal(
      delta_loglik$delta_likelihood,
      c(2.32800608025814e-05, 9.26642482356691e-05, 2.06715834793820e-04,
        3.62924830762104e-04, 5.57788985005683e-04, 7.87118701946138e-04,
        1.04644324151069e-03, 1.33136764594308e-03, 1.63780677305619e-03,
        1.96209880701655e-03, 2.30103219815054e-03, 2.65182528244725e-03,
        3.01208021053154e-03, 3.37973306627115e-03, 3.75300834587487e-03,
        4.13036559788758e-03, 4.51048858164757e-03, 4.89217240530221e-03,
        5.27445567923409e-03, 5.65632524964161e-03, 6.03720248845497e-03,
        6.41625956841483e-03, 6.79300145186166e-03, 7.16677973371563e-03,
        7.53718265402593e-03, 7.90380519752154e-03, 8.26629294836705e-03,
        8.62434745930139e-03, 8.97770036120429e-03, 9.32613067881741e-03,
        9.66945053656103e-03, 1.00075040130667e-02, 1.03401641426361e-02,
        1.06673301641405e-02, 1.09889305525891e-02, 1.13048929591121e-02,
        1.16151976377031e-02, 1.19198200134684e-02, 1.22187566824545e-02,
        1.25120182193770e-02, 1.27996276360700e-02, 1.30816199289671e-02,
        1.33580359955013e-02, 1.36289290122218e-02, 1.38943584131113e-02,
        1.41543900930699e-02, 1.44090955144761e-02, 1.46585508944449e-02,
        1.49028364674503e-02, 1.51420358180244e-02))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
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
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    delta_loglik <- calc_rr_approach_cr(parameter = "anagenesis",
                                        clade = "lineage")
    testthat::expect_length(delta_loglik, 2)
    testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
    testthat::expect_true(is.numeric(delta_loglik$sd))
    testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
    testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
    testthat::expect_equal(
      delta_loglik$delta_likelihood,
      c(1.33599884020313e-09, 5.30587986914688e-09, 1.17931795865292e-08,
        2.07348819416392e-08, 3.19830672588367e-08, 4.36562324311607e-08,
        4.19814554794909e-08, 1.48903503823135e-07, 9.15947692180577e-08,
        1.09174282912627e-07, 1.27561578212691e-07, 1.48973709493405e-07,
        1.65309062726687e-07, 1.84428338405838e-07, 2.03397900234298e-07,
        2.22373421551736e-07, 2.41730925256735e-07, 2.60674733813283e-07,
        2.77965854191681e-07, 2.95798444391315e-07, 3.13215913923075e-07,
        3.30103445672809e-07, 3.46823683599652e-07, 3.63105794670519e-07,
        3.78971949886557e-07, 3.94210910463488e-07, 4.08735044684326e-07,
        4.23091893995281e-07, 4.37003624442593e-07, 4.50471314908038e-07,
        4.62875049129195e-07, 4.78146667240789e-07, 4.88465022571542e-07,
        5.00361486487945e-07, 5.11889594834343e-07, 5.23064916238720e-07,
        5.33770960604862e-07, 5.44096247583579e-07, 5.53982415364696e-07,
        5.48672683874270e-07, 5.81582424222064e-07, 1.13027556531212e-07,
        5.90688112012648e-07, 5.99750021736123e-07, 6.08905749005344e-07,
        6.17972476411530e-07, 2.94997339283717e-07, 8.25268165640172e-07,
        7.25853053966906e-07, 7.48279936789963e-07))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("calc_rr_approach_cr cladogenesis radiation produces correct
          output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    delta_loglik <- calc_rr_approach_cr(parameter = "cladogenesis",
                                        clade = "radiation")
    testthat::expect_length(delta_loglik, 2)
    testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
    testthat::expect_true(is.numeric(delta_loglik$sd))
    testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
    testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
    testthat::expect_equal(
      delta_loglik$delta_likelihood,
      c(0.150030423453071, 0.572822017860771, 1.195231445574999,
        1.922155267819285, 2.665766073888195, 3.365165314558464,
        3.989411588732874, 4.529703727327211, 4.989668388775874,
        5.378265421458771, 5.705782344084664, 5.981963274109180,
        6.215317521368066, 6.412993019538814, 6.580884068637596,
        6.723814159724934, 6.845724349587782, 6.949840887298887,
        7.038815135352100, 7.114836818390608, 7.179724304883087,
        7.234996137798746, 7.281927584817938, 7.321595565624091,
        7.354914245618260, 7.382663574928846, 7.405515794928289,
        7.424035792142881, 7.438732360942548, 7.450034199403814,
        7.458318094662063, 7.463913596593964, 7.467109901355634,
        7.468161588697587, 7.467293426505450, 7.464704412355577,
        7.460571188001166, 7.455050935976852, 7.448283846629074,
        7.440395227203392, 7.431497311430879, 7.421690817540151,
        7.411066294064275, 7.399705286033528, 7.387681348576722,
        7.375060930427571, 7.361904146170055, 7.348265453020061,
        7.334194245427017, 7.319735378775366))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("calc_rr_approach_cr extinction radiation produces correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    delta_loglik <- calc_rr_approach_cr(parameter = "extinction",
                                        clade = "radiation")
    testthat::expect_length(delta_loglik, 2)
    testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
    testthat::expect_true(is.numeric(delta_loglik$sd))
    testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
    testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
    testthat::expect_equal(
      delta_loglik$delta_likelihood,
      c(0.0740239111733541, 0.2749207721938021, 0.5525359186609844,
        0.8543025852117907, 1.1430554739386878, 1.3998517450988288,
        1.6188230312547987, 1.8011741204303178, 1.9510746035897188,
        2.0734462689966939, 2.1729638795892168, 2.2536945279128364,
        2.3190326894965292, 2.3717549804306639, 2.4141124025283780,
        2.4479249453738383, 2.4746654738118092, 2.4955295513599882,
        2.5114917923008697, 2.5233506605909639, 2.5317632946678277,
        2.5372741613048326, 2.5403360148876910, 2.5413277306000683,
        2.5405677149466754, 2.5383247696912861, 2.5348268783927637,
        2.5302681593329250, 2.5248145097876034, 2.5186081896014176,
        2.5117715632138573, 2.5044101704256505, 2.4966152595213273,
        2.4884658872350585, 2.4800306683955764, 2.4713692405691017,
        2.4625334959323055, 2.4535686220292305, 2.4445139848027218,
        2.4354038809592460, 2.4262681817511567, 2.4171328856633476,
        2.4080205945617319, 2.3989509261731339, 2.3899408710234198,
        2.3810051038923348, 2.3721562551459652, 2.3634051484609291,
        2.3547610096104261, 2.3462316495778044))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("calc_rr_approach_cr anagenesis radiation produces correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    delta_loglik <- calc_rr_approach_cr(parameter = "anagenesis",
                                        clade = "radiation")
    testthat::expect_length(delta_loglik, 2)
    testthat::expect_equal(names(delta_loglik), c("sd", "delta_likelihood"))
    testthat::expect_true(is.numeric(delta_loglik$sd))
    testthat::expect_true(is.numeric(delta_loglik$delta_likelihood))
    testthat::expect_equal(delta_loglik$sd, seq(0.1, 5.0, 0.1))
    testthat::expect_equal(
      delta_loglik$delta_likelihood,
      c(8.35111702457425e-07, 3.31535082409573e-06, 7.36793565003779e-06,
        1.28792338554007e-05, 1.97049082704126e-05, 2.76828058911605e-05,
        3.66539178937586e-05, 4.63239718797581e-05, 5.68010529775620e-05,
        6.76935174599436e-05, 7.89381449770588e-05, 9.04117765330170e-05,
        1.02018039775942e-04, 1.13660287551554e-04, 1.25267225930870e-04,
        1.36777525048259e-04, 1.48141205695396e-04, 1.59319490448340e-04,
        1.70282632225849e-04, 1.81004840062116e-04, 1.91469575501202e-04,
        2.01664656245271e-04, 2.11581525677573e-04, 2.21216015884096e-04,
        2.30566403866206e-04, 2.39633401628581e-04, 2.48419444956127e-04,
        2.56927999904732e-04, 2.65164851969146e-04, 2.73135137584646e-04,
        2.80846695140724e-04, 2.88301812526370e-04, 2.95516693515907e-04,
        3.02491809653915e-04, 3.09236731505180e-04, 3.15759695862283e-04,
        3.22067812581039e-04, 3.28169061408090e-04, 3.34071165605465e-04,
        3.39795301206536e-04, 3.45295450390637e-04, 3.51347980853234e-04,
        3.55824505502866e-04, 3.60833589846621e-04, 3.65684587814386e-04,
        3.70380733327735e-04, 3.75263282762717e-04, 3.79148196403278e-04,
        3.83528411997958e-04, 3.87656867829378e-04))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
