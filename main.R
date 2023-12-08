cat("\f") # clean the console
rm(list = ls()) # clean the environment

# Install and import readxl
install.packages("readxl")
library("readxl")

# Read data from file
spotify_data <- read.csv("./spotify-2023.csv")

fit_lm <- lm(bpm ~ streams, spotify_data)
print(summary(fit_lm))

# Plotting the data points
plot(spotify_data$streams, spotify_data$bpm, main = "Streams vs BPM",
     xlab = "BPM", ylab = "Streams",
     pch = 19)

# Adding the regression line to the above plot
abline(fit_lm, col = "blue")

# Chi Squared Test
chi_squared_test <- chisq.test(unlist(x = spotify_data$streams), unlist(x = spotify_data$bpm), TRUE)
print(chi_squared_test)
