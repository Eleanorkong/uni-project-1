# simulate_test function (main function)
source("src/tests/simulate_input_check_fns.R")

# generate simulation and get power or size of both tests
# Inputs:
#   sc : scenarios (1 or 2 or 3 or 4) (default as 1)
#   n1 : simulated sample size of group 1
#   n2 : simulated sample size of group 2
#   mean1 : mean of group 1 for simulated sample
#   mean2 : mean of group 2 for simulated sample 
#   sd1 : standard derivation of group 1 for simulated sample 
#   sd2 : standard derivation of group 2 for simulated sample 
#   nsim : number of simulation (default as 1000)
#   H1 : alternative hypothesis ("less", "two.sided", default as "greater")
#   test: statistical tests we wish to examine ("wilcox.test", default as "t.test")
# Outputs: 
#   one dimensional array: effect size (mu1 - mu2) and size or power of related tests

simulate_test <- function(sc = 1, n1, n2, mean1, mean2, sd1, sd2, nsim = 1000, 
                            H1 = "greater", test = "t.test") {
  # input check
  if (simulate_input_test(sc, n1, n2, mean1, mean2, sd1, sd2, nsim, H1, test) == FALSE) {
    stop(call. = TRUE, "invalid arguments")
  }
  # create empty p-values
  p_value <- rep(0, nsim)
  # simulate the data using rnorm under difference scenario
  for (i in 1:nsim) {
    if (sc == 1 | 3 | 4) {
      x <- data.frame(group = "g1", result = rnorm(n1, mean1, sd1))
      y <- data.frame(group = "g2", result = rnorm(n2, mean2, sd2))
    } else if (sc == 2) {
      x <- data.frame(group = "g1", result = round(rnorm(n1, mean1, sd1)))
      y <- data.frame(group = "g2", result = round(rnorm(n2, mean2, sd2)))
    }
    # combine two dataframes
    sample <- rbind(x, y)
    # apply the two chosen statistical tests to the simulated data
    if (test == "t.test") {
      p_value[i] <- t.test(result ~ group, data = sample, alternative = H1)$p.value
    } else {
      p_value[i] <- wilcox.test(result ~ group, data = sample, alternative = H1)$p.value
    }
  }
  # calculate effect size 
  d <- mean1 - mean2
  # calculate the size and power of these statistical tests under each scenario
  if (d == 0 & test == "t.test") {
    size_t <- sum(p_value <= 0.05) / nsim
    return(c("effect size" = d, 
             "size of t_test" = size_t))
  } else if (d != 0 & test == "t.test") {
    power_t <- sum(p_value <= 0.05) / nsim
    return(c("effect size" = d, 
             "power of t_test" = power_t))
  } else if (d == 0 & test == "wilcox.test") {
    size_mann <- sum(p_value <= 0.05) / nsim
    return(c("effect size" = d, 
             "size of mann_test" = size_mann))
  } else {
    power_mann <- sum(p_value <= 0.05) / nsim
    return(c("effect size" = d, 
             "power of mann_test" = power_mann))
  }
}

