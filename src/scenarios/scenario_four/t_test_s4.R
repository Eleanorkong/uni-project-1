## scenario four (t_test) : explore the effect of effect size 
source("src/simulate_test_fns.R")
source("src/sc4_effect_size_increase_fns.R")
source("src/sc134_increase_fns.R")

## general analysis 
# power
set.seed(9)
simulate_test(sc = 4, n1 = 100, n2 = 100, mean1 = 269, mean2 = 268.5, 
              sd1 = 11, sd2 = 7)
# effect size   power of t_test 
#  0.5            0.12 
simulate_test(sc = 4, n1 = 100, n2 = 100, mean1 = 270, mean2 = 268.5, 
              sd1 = 11, sd2 = 7)
# effect size   power of t_test 
#  1.5            0.308 
simulate_test(sc = 4, n1 = 100, n2 = 100, mean1 = 280, mean2 = 268.5, 
              sd1 = 11, sd2 = 7)
# effect size   power of t_test 
#  11.5            1.0 

## plots for effect size increasing from 1 to 20 given increasing sample size (width = 1)
# power 
par(mfrow=c(1,3))
set.seed(10)
effect_size_increase(upper = 20, n = 10)
effect_size_increase(upper = 20, n = 100)
effect_size_increase(upper = 20, n = 1000)

## analysis of small effect size 
set.seed(6)
simulate_test(sc = 4, n1 = 10000, n2 = 10000, mean1 = 268.7, mean2 = 268.5,
              sd1 = 11, sd2 = 7)
# effect size power of t_test 
#   0.200           0.452 

## plots of power as n increases when effect size is 0.2 / 0.5 / 0.8
# power
par(mfrow=c(1,3))
set.seed(10)
increase(sc = 4, lower = 50, upper = 1000, width = 50, mean1 = 268.7, mean2 = 268.5)
increase(sc = 4, lower = 50, upper = 1000, width = 50, mean1 = 269, mean2 = 268.5)
increase(sc = 4, lower = 50, upper = 1000, width = 50, mean1 = 269.3, mean2 = 268.5)


