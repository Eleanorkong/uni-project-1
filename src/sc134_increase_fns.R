# increase function for sc134
source("src/simulate_test_fns.R")

# examine power and size when 
# sc1 : n increasing 
# sc3 : standard derivation increasing
# sc4 : evaluate the impact of small effect size on sample sizes 
# Inputs:
#   sc : scenario (1 or 3 or 4) 
#   lower : lower bound (set default as 10)
#   upper : upper bound (set default as 11)
#   width : number (increment of the sequence) (default as 10)
#   mean1 : mean of group 1 for simulated sample 
#   mean2 : mean of group 2 for simulated sample 
#   test : statistical tests we wish to examine ("wilcox.test", default as "t.test")
# Outputs:
#   return plot 
#   sc = 1 : x = sample size n, y = power / size of t_test / mann_test
#   sc = 4 : x = sample size n, y = power of t_test / mann_test
#   sc = 3 : x = standard derivation, y = power / size of t_test / mann_test

increase <- function(sc = 1, lower = 10, upper = 11, width = 10, mean1, mean2, 
                     test = "t.test") {
  # Input checks
  if (sc != 1 && sc != 3 && sc!= 4) {
    stop("invalid arguments")
  } else if (lower <= 0 | upper <= 0 | upper < width)  {
    stop("invalid arguments")
  } 
  # create an empty vector 
  x <- vector()
  # create sequence with width
  s <- seq(lower, upper, by = width)
  # calculate size or power
  for (i in s) {
    if (sc == 1) {
      x[i] <- simulate_test(sc = 1, n1 = i, n2 = i, mean1 = mean1, mean2 = mean2, 
                            sd1 = 11, sd2 = 7, test = test)[2]
    } else if (sc == 4) {
      x[i] <- simulate_test(sc = 4, n1 = i, n2 = i, mean1 = mean1, mean2 = mean2, 
                            sd1 = 1, sd2 = 1, test = test)[2]
    } else {  
      x[i] <- simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = mean1, mean2 = mean2, 
                            sd1 = i, sd2 = i, test = test)[2]
    } 
  }
  # delete the empty numbers inside the vector
  x <- x[lower:upper]
  # create dataframe
  y <- data.frame(n = lower:upper, x)
  # calculate effect size 
  d <- mean1 - mean2
  # return relative plots
  if (sc == 1 & d == 0 & test == "t.test") {
    return(plot(y$n, y$x, xlab = "sample size n", 
                ylab = "size of t_test"))
  } else if (sc == 1 & d != 0 & test == "t.test") {
    return(plot(y$n, y$x, xlab = "sample size n", 
                ylab = "power of t_test"))
  } else if (sc == 1 & d == 0 & test == "wilcox.test") {
    return(plot(y$n, y$x, xlab = "sample size n", 
                ylab = "size of mann_test"))
  } else if (sc == 1 & d != 0 & test == "wilcox.test") {
    return(plot(y$n, y$x, xlab = "sample size n", 
                ylab = "power of mann_test"))
  } else if (sc == 4 & d != 0 & test == "t.test") {
    return(plot(y$n, y$x, xlab = "sample size n",
                ylab = "power of t_test"))
  } else if (sc == 4 & d != 0 & test == "wilcox.test") {
    return(plot(y$n, y$x, xlab = "sample size n",
                ylab = "power of mann_test"))
  } else if (sc == 3 & d == 0 & test == "t.test") {
    return(plot(y$n, y$x, xlab = "standard derivation", 
                ylab = "size of t_test"))
  } else if (sc == 3 & d != 0 & test == "t.test") {
    return(plot(y$n, y$x, xlab = "standard derivation", 
                ylab = "power of t_test"))
  } else if (sc == 3 & d == 0 & test == "wilcox.test") {
    return(plot(y$n, y$x, xlab = "standard derivation", 
                ylab = "size of mann_test"))
  } else {
    return(plot(y$n, y$x, xlab = "standard derivation", 
                ylab = "power of mann_test"))
  } 
}

