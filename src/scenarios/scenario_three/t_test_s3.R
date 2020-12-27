## scenario three (t_test) : explore the effect of sd 
source("src/simulate_test_fns.R")
source("src/sc13_d_increase_fns.R")
source("src/sc134_increase_fns.R")

## case one : sd1 small vs sd2 large 
# size
set.seed(10)
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 1, sd2 = 10)
# effect size   size of t_test 
#    0.000          0.038
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 1, sd2 = 50)
# effect size   size of t_test 
#    0.000          0.049

# power
set.seed(120)
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 1, sd2 = 10)
# effect size   power of t_test 
#  13.6           1.0
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 1, sd2 = 50)
# effect size   power of t_test 
#  13.6           0.845

## case two : sd1 = sd2 but increasing
# size 
set.seed(10)
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 10, sd2 = 10)
# effect size   size of t_test 
#   0.000           0.053
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 50, sd2 = 50)
# effect size   size of t_test 
#   0.000           0.056

# power 
set.seed(120)
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 10, sd2 = 10)
# effect size   power of t_test 
#   13.600        1.0
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 50, sd2 = 50)
# effect size   power of t_test 
#   13.6           0.601

## plots (difference between sd1 and sd2 is increasing) : sd1 = 11, sd2 = from 12 to 100
# size
par(mfrow=c(1,2))
set.seed(8)
d_increase(sc = 3, d_upper = 89, width = 1, mean1 = 282.1, mean2 = 282.1)

# power
set.seed(9)
d_increase(sc = 3, d_upper = 89, width = 1, mean1 = 282.1, mean2 = 268.5)

## plots (sd1 and sd2 are increasing) : from sd1 = sd2 = 10 to 100
# size
par(mfrow=c(1,2))
set.seed(2)
increase(sc = 3, upper = 100, width = 1, mean1 = 282.1, mean2 = 282.1)

# power
set.seed(5)
increase(sc = 3, upper = 100, width = 1, mean1 = 282.1, mean2 = 268.5)






