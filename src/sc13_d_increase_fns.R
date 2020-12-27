# d_increase function for sc13
source("src/simulate_test_fns.R")

# examine power and size when 
# sc1 : difference between n increasing 
# sc3 : difference between standard derivation increasing 
# Inputs:
#   sc : scenario (1 or 3) 
#   d_lower : lower bound of difference (set default as 1)
#   d_upper : upper bound of difference (set default as 10)
#   width : number (increment of the sequence) (default as 10)
#   mean1 : mean of group 1 for simulated sample 
#   mean2 : mean of group 2 for simulated sample 
#   test : statistical tests we wish to examine ("wilcox.test", default as "t.test")
# Outputs:
#   return plot 
#   sc = 1 : x = difference between n1 and n2, 
#            y = power / size of t.test / wilcox.test
#   sc = 3 : x = difference between sd1 and sd2, 
#            y = power / size of t.test / wilcox.test

d_increase <- function(sc = 1, d_lower = 1, d_upper = 10, width = 10, mean1, mean2, 
                       test = "t.test") {
  # Input checks
  if (sc != 1 && sc != 3) {
    stop("invalid arguments")
  } else if (d_lower <= 0 | d_upper <= 0 | d_upper < width)  {
    stop("invalid arguments")
  } 
  # create an empty vector 
  x <- vector()
  # crease sequences
  s <- seq(d_lower, d_upper, by = width)
  # calculate size or power
  for (i in s) {
    if (sc == 1) {
      x[i] <- simulate_test(sc = 1, n1 = 10, n2 = 10 + i, mean1 = mean1, mean2 = mean2, 
                            sd1 = 11, sd2 = 7, test = test)[2]
    } else {
      x[i] <- simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = mean1, mean2 = mean2, 
                            sd1 = 11, sd2 = 11 + i, test = test)[2]
    } 
  }
  # delete the empty numbers inside the vector 
  x <- x[d_lower:d_upper]
  # create dataframe
  y <- data.frame(diff = d_lower:d_upper, x)
  # calculate effect size 
  d <- mean1 - mean2
  # return relative plots 
  if (sc == 1 & d == 0 & test == "t.test") {
    return(plot(y$diff, y$x, xlab = "difference between n1 and n2", 
                ylab = "size of t_test"))
  } else if (sc == 1 & d != 0 & test == "t.test") {
    return(plot(y$diff, y$x, xlab = "difference between n1 and n2", 
                ylab = "power of t_test"))
  } else if (sc == 1 & d == 0 & test == "wilcox.test") {
    return(plot(y$diff, y$x, xlab = "difference between n1 and n2", 
                ylab = "size of mann_test"))
  } else if (sc == 1 & d != 0 & test == "wilcox.test") {
    return(plot(y$diff, y$x, xlab = "difference between n1 and n2", 
                ylab = "power of mann_test"))
  } else if (sc == 3 & d == 0 & test == "t.test") {
    return(plot(y$diff, y$x, xlab = "difference between sd1 and sd2", 
                ylab = "size of t_test"))
  } else if (sc == 3 & d != 0 & test == "t.test") {
    return(plot(y$diff, y$x, xlab = "difference between sd1 and sd2", 
                ylab = "power of t_test"))
  } else if (sc == 3 & d == 0 & test == "wilcox.test") {
    return(plot(y$diff, y$x, xlab = "difference between sd1 and sd2", 
                ylab = "size of mann_test"))
  } else {
    return(plot(y$diff, y$x, xlab = "difference between sd1 and sd2", 
                ylab = "power of mann_test"))
  } 
}
