# Exploratory Data Analysis 

# read in data 
data <- readRDS("data/data.Rds")

# plot the data
boxplot(concentration ~ gas, data = data)

# summarize data
summary(data$concentration[data$gas == "CO2"])
summary(data$concentration[data$gas == "N2O"])

# sd 
co2_sd <- sd(data$concentration[data$gas == "CO2"])
n2o_sd <- sd(data$concentration[data$gas == "N2O"])

# check if there is a siginificant differences between two groups
t.test(concentration ~ gas, data = data, alternative = "greater")

# explore qq plot
par(mfrow=c(1,2))
qqnorm(data$concentration[data$gas == "CO2"])
qqline(data$concentration[data$gas == "CO2"])

qqnorm(data$concentration[data$gas == "N2O"])
qqline(data$concentration[data$gas == "N2O"])

