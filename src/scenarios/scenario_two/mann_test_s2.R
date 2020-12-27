## scenario two (mann_test) : explore the effect of measurment error (rounded to nearest integer)
source("src/simulate_test_fns.R")
source("src/sc2_measure_error_fns.R")

## rounded or not 
# size 
set.seed(10)
simulate_test(sc = 2, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 11, sd2 = 7, test = "wilcox.test")
# effect size   size of t_test 
#   0.000           0.055
simulate_test(sc = 1, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 11, sd2 = 7, test = "wilcox.test")
# effect size   size of t_test 
#   0.000           0.058

# power
set.seed(120)
simulate_test(sc = 2, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 11, sd2 = 7, test = "wilcox.test")
# effect size   power of t_test 
#   13.6             1.0
simulate_test(sc = 1, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 11, sd2 = 7, test = "wilcox.test")
# effect size   power of t_test 
#   13.6          1.0

## plots of getting 100 size and power under scenario 2 (width = 1)
# size 
par(mfrow=c(1,2))
set.seed(2)
measure_error(mean1 = 282.1, mean2 = 282.1, test = "wilcox.test", round = 100)

# power
set.seed(5)
measure_error(mean1 = 282.1, mean2 = 268.5, test = "wilcox.test", round = 100)









