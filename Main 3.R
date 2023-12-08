cat("\f") # clean the console
rm(list = ls()) # clean the environment
dev.off() # if there are previous plots then clean them
library(readxl)
print("===========================================")
df <- read_excel("spotify-2023.xlsx")
obs <- df$bpm
streams <- as.numeric(df$streams)
chi_squared_test <- chisq.test(unlist(x = streams), unlist(obs), TRUE)
print(chi_squared_test)
