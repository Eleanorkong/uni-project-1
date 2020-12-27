## scenario one (t_test): explore the effect of sample sizes 
source("src/simulate_test_fns.R")
source("src/sc134_increase_fns.R")
source("src/sc13_d_increase_fns.R")

## case one : n1 small vs n2 large
# size 
set.seed(10)
simulate_test(sc = 1, n1 = 10, n2 = 50, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 11, sd2 = 7)
# effect size   size of t_test 
#   0.000           0.056
simulate_test(sc = 1, n1 = 10, n2 = 1000, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 11, sd2 = 7)
# effect size   size of t_test 
#   0.000           0.063

# power
set.seed(120)
simulate_test(sc = 1, n1 = 10, n2 = 50, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 11, sd2 = 7)
# effect size   power of t_test 
#   13.600          0.961
simulate_test(sc = 1, n1 = 10, n2 = 1000, mean1 = 282.1, mean2 = 268.5, 
                sd1 = 11, sd2 = 7)
# effect size   power of t_test 
#   13.600          0.98


## case two : n1 = n2 but increasing
# size 
set.seed(10)
simulate_test(sc = 1, n1 = 10, n2 = 10, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 11, sd2 = 7)
# effect size   size of t_test 
#   0.000           0.078
simulate_test(sc = 1, n1 = 1000, n2 = 1000, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 11, sd2 = 7)
# effect size   size of t_test 
#   0.000           0.055

# power 
set.seed(120)
simulate_test(sc = 1, n1 = 10, n2 = 10, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 11, sd2 = 7)
# effect size   power of t_test 
#   13.600        0.935
simulate_test(sc = 1, n1 = 1000, n2 = 1000, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 11, sd2 = 7)
# effect size   power of t_test 
#   13.6           1.0

## plots (difference between n1 and n2 is increasing) : n1 = 10, n2 = from 10 to 1000
# size
par(mfrow=c(1,2))
set.seed(8)
d_increase(d_upper = 990, width = 10, mean1 = 282.1, mean2 = 282.1)

# power
set.seed(9)
d_increase(d_upper = 990, width = 10, mean1 = 282.1, mean2 = 268.5)

## plots (n1 and n2 are increasing) : from n1 = n2 = 10 to 1000
# size
par(mfrow=c(1,2))
set.seed(2)
increase(lower = 10, upper = 1000, width = 10, mean1 = 282.1, mean2 = 282.1)

# power
set.seed(5)
increase(lower = 10, upper = 1000, width = 10, mean1 = 282.1, mean2 = 268.5)



