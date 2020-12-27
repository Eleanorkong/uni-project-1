## scenario three (mann_test) : explore the effect of sd 
source("src/simulate_test_fns.R")
source("src/sc13_d_increase_fns.R")
source("src/sc134_increase_fns.R")

## case one : sd1 small vs sd2 large 
# size
set.seed(10)
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 1, sd2 = 10, test = "wilcox.test")
# effect size   size of mann_test 
#    0.000          0.078
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 1, sd2 = 50, test = "wilcox.test")
# effect size   size of mann_test 
#    0.000          0.089

# power
set.seed(120)
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 1, sd2 = 10, test = "wilcox.test")
# effect size   power of mann_test 
#  13.6           1.0
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 1, sd2 = 50, test = "wilcox.test")
# effect size   power of mann_test 
#  13.6           0.801

## case two : sd1 = sd2 but increasing
# size 
set.seed(10)
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 10, sd2 = 10, test = "wilcox.test")
# effect size   size of mann_test 
#   0.000           0.047
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 282.1, 
              sd1 = 50, sd2 = 50, test = "wilcox.test")
# effect size   size of mann_test 
#   0.000           0.054

# power 
set.seed(120)
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 10, sd2 = 10, test = "wilcox.test")
# effect size   power of mann_test 
#   13.600        1.0
simulate_test(sc = 3, n1 = 100, n2 = 100, mean1 = 282.1, mean2 = 268.5, 
              sd1 = 50, sd2 = 50, test = "wilcox.test")
# effect size   power of mann_test 
#   13.6           0.572

## plots of difference between sd increasing, sd1 = 11, sd2 = 12 to 100
# size
par(mfrow=c(1,2))
set.seed(8)
d_increase(sc = 3, d_upper = 89, width = 1, mean1 = 282.1, mean2 = 282.1, 
           test = "wilcox.test")

# power
set.seed(9)
d_increase(sc = 3, d_upper = 89, width = 1, mean1 = 282.1, mean2 = 268.5, 
           test = "wilcox.test")

## plots of sd increasing, sd1 = sd2 = 10 to 100
# size
par(mfrow=c(1,2))
set.seed(2)
increase(sc = 3, upper = 100, width = 1, mean1 = 282.1, mean2 = 282.1, 
         test = "wilcox.test")

# power
set.seed(5)
increase(sc = 3, upper = 100, width = 1, mean1 = 282.1, mean2 = 268.5, 
         test = "wilcox.test")






