# EDA WEEK1 - COURSE PROJECT 1 - PLOT 1
# -------------------------------------

library(dplyr)
library(readr)

# 1. Loading and filtering the data

source("eda_pc1_load_data.R")
txt_path <- "~/Library/Mobile Documents/com~apple~CloudDocs/Data/household_power_consumption.txt"
power <- eda_pc1_load_data(txt_path)

# 2. Making plot 1

  ## Histogram of Global Active Power in red 
  hist(x = power$Global_active_power, 
       col = "red", main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")

  
# 3. Saving plot as PNG file
  
  ## Copying device to PNG file
  dev.copy(png, "plot1.png")
  
  ## Closing device
  dev.off()
  