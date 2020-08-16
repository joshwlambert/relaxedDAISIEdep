### Generate simulation data for model performance testing ###

library(DAISIE)

lac <- c(1.0, 2.0)
mu <- c(1.0, 2.0)
K <- c(10, 30, Inf)
gam <- c(0.005, 0.01)
laa <- c(0.5, 1.0)
sd <- c(1, 10)

param_space <- expand.grid(lac = lac,
                           mu = mu,
                           K = K,
                           gam = gam,
                           laa = laa,
                           sd = sd)

save(param_space, file = "param_space.RData")
