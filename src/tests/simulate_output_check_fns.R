# simulate_output_test function 
source("src/simulate_test_fns.R")

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
#   print "PASSED" if outputs matches with expected outputs
#   print "FAILED" if outputs don't match the expected one

simulate_output_test <- function(sc = 1, n1, n2, mean1, mean2, sd1, sd2, nsim = 1000, 
                                 H1 = "greater", test = "t.test") {
  out <- simulate_test(sc, n1, n2, mean1, mean2, sd1, sd2, nsim, H1, test)
  # calculate effect size
  d <- mean1 - mean2 
  # outputs length correct? 
  if (length(out) == 2) {
    print("PASSED: output length correct")
  } else {
    print("FAILED: output length incorrect")
  }
  # effect size correct? 
  if (out[[1]] == d) {
    print("PASSED: effect size correct")
  } else {
    print("FAILED: effect size incorrect")
  }
  # size or power correct (between 0 and 1)? 
  if (0 <= out[[2]] & out[[2]] <= 1) {
    print("PASSED: size/power correct")
  } else {
    print("FAILED: size/power incorrect")
  }
}
