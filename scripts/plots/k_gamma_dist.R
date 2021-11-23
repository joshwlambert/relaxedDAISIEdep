gamma_density <- dgamma(x = seq(0.1, 50, 0.01), shape = 3, scale = 4)
index <- seq(0.1, 50, 0.01)
data <- data.frame(index = index,
                   gamma_density = gamma_density)
plot(x = data$index,
     y = data$gamma_density,
     type = 'l',
     ylab = "Probability Density",
     xlab = "Carrying Capacity (K')",
     lwd = 2,
     col = "blue")
abline(v = 30)



