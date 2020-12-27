# meansure_error function for sc2
source("src/simulate_test_fns.R")

# examine power and size when there is or is not measurement error 
# Inputs:
#   n1 : sample size for group 1 (set default as 100)
#   n2 : sample size for group 2 (set default as 100)
#   mean1 : mean of group 1 for simulated sample 
#   mean2 : mean of group 2 for simulated sample 
#   test : statistical tests we wish to examine ("wilcox.test", default as "t.test")
#   round : number of times we run the scenario 2 (set default as 20)
#   width : number (increment of the sequence) (set default as 1)
# Outputs:
#   return plot (x = round, y = power / size of t_test / mann_test)

measure_error <- function(n1 = 100, n2 = 100, mean1, mean2, test = "t.test", 
                          round = 20, width = 1) {
  # Input checks
  if (n1 <= 0 | n2 <= 0 | round <= 0 | round < width) {
    stop ("invalid arguments")
  }
  # create an empty vector
  x <- vector()
  # create sequence with width
  s <- seq(1, round, by = width)
  # calculate size or power
  for (i in s) {
    x[i] <- simulate_test(sc = 2, n1 = n1, n2 = n2, mean1 = mean1, mean2 = mean2, 
                          sd1 = 11, sd2 = 7, test = test)[2]
  }
  x <- x[1:round]
  # create dataframe
  y <-  data.frame(r = 1:round, x)
  # calculate effect size 
  d <- mean1 - mean2
  # return relative plots 
  if (d == 0 & test == "t.test") {
    return(plot(y$r, y$x, xlab = "round", ylab = "size of t_test"))
  } else if (d != 0 & test == "t.test") {
    return(plot(y$r, y$x, xlab = "round", ylab = "power of t_test"))
  } else if (d == 0 & test == "wilcox.test") {
    return(plot(y$r, y$x, xlab = "round", ylab = "size of mann_test"))
  } else {
    return(plot(y$r, y$x, xlab = "round", ylab = "power of mann_test"))
  }
}

