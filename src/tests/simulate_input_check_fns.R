# simulate_input_test function 
# Inputs: 
#   sc : scenarios (1 or 2 or 3 or 4)
#   n1 : simulated sample size of group 1
#   n2 : simulated sample size of group 2
#   mean1 : mean of group 1 for simulated sample
#   mean2 : mean of group 2 for simulated sample 
#   sd1 : standard derivation of group 1 for simulated sample 
#   sd2 : standard derivation of group 2 for simulated sample 
#   nsim : number of simulation 
#   H1 : alternative hypothesis 
#   test : statistical tests we wish to examine  
# Outputs:
#   returns FALSE if the required properties are not met, TRUE otherwise

simulate_input_test <- function(sc, n1, n2, mean1, mean2, sd1, sd2, nsim, H1, test) {
  # check scenario number 
  if (sc != 1 && sc != 2 && sc != 3 && sc != 4) {
    return(FALSE)
  }
  # check name of chosen two tests 
  else if (test != "t.test" && test != "wilcox.test") {
    return(FALSE)
  }
  # check nsim should be numeric 
  else if (class(nsim) != "numeric") {
    return(FALSE)
  }
  # check specified H1 (used inside the test function)
  else if (H1 != "less" && H1 != "greater" && H1 != "two.sided") {
    return(FALSE)
  }
  # check sample size, nsim and standard derivation 
  else if (n1 <= 0 |
           n2 <= 0 |
           sd1 < 0 |
           sd2 < 0 |
           nsim <= 0) {
    return(FALSE)
  }
  # check sc, sample sizes and nsim should be integer
  else if (abs(sc - round(sc)) > 1e-10 |
           abs(n1 - round(n1)) > 1e-10 |
           abs(n2 - round(n2)) > 1e-10 |
           abs(nsim - round(nsim)) > 1e-10) {
    return(FALSE)
  }
  else {
    return (TRUE)
  }
}




  