gamma_density_1 <- dgamma(x = seq(0.1, 10, 0.01), shape = 1, scale = 1)
gamma_density_2 <- dgamma(x = seq(0.1, 10, 0.01), shape = 2, scale = 1)
gamma_density_3 <- dgamma(x = seq(0.1, 10, 0.01), shape = 4, scale = 1)
index <- seq(0.1, 10, 0.01)
data <- data.frame(index = index,
                   gamma_density_1 = gamma_density_1,
                   gamma_density_2 = gamma_density_2,
                   gamma_density_3 = gamma_density_3)
plot(x = data$index,
     y = data$gamma_density_1,
     type = 'l',
     ylab = "Gamma Probability Density",
     xlab = "Value",
     lwd = 2,
     col = "green")
lines(x = data$index,
      y = data$gamma_density_2,
      type = 'l',
      lwd = 2,
      col = "red")
lines(x = data$index,
      y = data$gamma_density_3,
      type = 'l',
      lwd = 2,
      col = "blue")
legend(x = 6,
       y = 0.8,
       legend = c(expression(paste("k = 1, ", theta, " = 1")),
                  expression(paste("k = 2, ", theta, " = 1",)),
                  expression(paste("k = 4, ", theta, " = 1"))),
       box.col = "white")



