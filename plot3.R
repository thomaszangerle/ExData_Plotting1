# EDA WEEK1 - COURSE PROJECT 1 - PLOT 3
# -------------------------------------

library(dplyr)
library(readr)

# 1. Loading and filtering the data

source("eda_pc1_load_data.R")
txt_path <- "~/Library/Mobile Documents/com~apple~CloudDocs/Data/household_power_consumption.txt"
power <- eda_pc1_load_data(txt_path)

  
# 2. Making plot 3

  with(power, {
    plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab="", 
         ylab="Energy sub metering", ylim=c(0,38))
    par(new = TRUE)
    plot(DateTime, Sub_metering_2, type = "l", col = "red", xlab="", 
         ylab="", ylim=c(0,38))
    par(new = TRUE)
    plot(DateTime, Sub_metering_3, type = "l", col = "blue", xlab="", 
         ylab="",  ylim=c(0,38))
    })
  legend(x = "topright", y = 38, 
         legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"), lty = 1)

# 3. Saving plot as PNG file

  ## Copying device to PNG file
  dev.copy(png, "plot3.png")
  
  ## Closing device
  dev.off()
