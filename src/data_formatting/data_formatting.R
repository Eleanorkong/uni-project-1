install.packages("dslabs")
library("dslabs")

install.packages("dplyr")
library("dplyr")

# explore the package
help(package = "dslabs")

# get greenhouse_gases dataset
data(greenhouse_gases)

# formatted data 
co2 <- filter(greenhouse_gases[, 2:3], gas == "CO2")
n2o <- filter(greenhouse_gases[, 2:3], gas == "N2O")
data <- rbind(co2, n2o)

# save formatted data
saveRDS(greenhouse_gases, "data/gas.Rds")
saveRDS(co2, "data/co2.Rds")
saveRDS(n2o, "data/n2o.Rds")
saveRDS(data, "data/data.Rds")
