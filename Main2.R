cat("\f") # clean the console
rm(list = ls()) # clean the environment
# Lets read the data
library(readxl)
df <- read_excel("spotify-2023.xlsx")
fit_lm <- lm(bpm ~ streams, data = df)
print(summary(fit_lm))

# Plotting the data points
plot(df$bpm, df$streams, main = "Streams vs BPM",
     xlab = "BPM", ylab = "Streams",
     pch = 19)

# Adding the regression line to the above plot
abline(fit_lm, col = "blue")
