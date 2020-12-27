# effect_size_increase function for sc4
source("src/simulate_test_fns.R")

# examine power when 
# sc4 : effect size increasing 
# Inputs:
#   lower : lower bound (set default as 1)
#   upper : upper bound (set default as 10)
#   width : number (increment of the sequence) (set default as 1)
#   n : sample size (n1 = n2 = n)
#   H1 : alternative hypothesis ("less", "two.sided", default as "greater")
#   test : statistical tests we wish to examine ("wilcox.test", default as "t.test")
# Outputs:
#   return plot(x = effect size, y = power of t_test / mann_test)

effect_size_increase <- function(lower = 1, upper = 10, width = 1, n, H1 = "greater", 
                                 test = "t.test") {
  # Input checks
  if (lower <= 0 | upper <= 0 | n <= 0 | upper < width) {
    stop ("invalid arguments")
  }
  # create an empty vector 
  x <- vector()
  # create sequence with width
  s <- seq(lower, upper, by = width)
  # calculate power
  for (i in s) {
    x[i] <- simulate_test(sc = 4, n1 = n, n2 = n, mean1 = 282.1 + i, mean2 = 282.1, 
                          sd1 = 11, sd2 = 7, H1 = H1, test = test)[2]
  }
  # delete the empty numbers inside the vector
  x <- x[lower:upper]
  # create dataframe
  y <- data.frame(diff = lower:upper, x)
  # return relative plots
  if (test == "t.test") {
    return(plot(y$diff, y$x, xlab = "effect size", 
                ylab = "power of t_test"))
  } else {
    return(plot(y$diff, y$x, xlab = "effect size", 
                ylab = "power of mann_test"))
  }
}





