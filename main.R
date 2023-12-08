cat("\f") # clean the console
rm(list = ls()) # clean the environment

# Install and import readxl
install.packages("readxl")
library("readxl")

# Read data from file
spotify_data <- read.csv("./spotify-2023.csv")

# Culled data to only include necessary variables.
# Fix for streams being assumed to be characters and not numeric.
data_culled <- data.frame(
  bpm = spotify_data$bpm,
  streams = as.numeric(spotify_data$streams)
)

fit_lm <- lm(bpm ~ streams, data_culled)
print(summary(fit_lm))

# Plotting the data points
plot(data_culled$bpm, data_culled$streams, main = "Streams vs BPM",
     xlab = "BPM", ylab = "Streams",
     pch = 19)

# Adding the regression line to the above plot
abline(fit_lm, col = "blue")

# Chi Squared Test
chi_squared_test <- chisq.test(unlist(x = data_culled$streams), unlist(x = data_culled$bpm), TRUE)
print(chi_squared_test)