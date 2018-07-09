# EDA WEEK1 - COURSE PROJECT 1 - PLOT 4
# -------------------------------------

library(dplyr)
library(readr)

# 1. Loading and filtering the data

source("eda_pc1_load_data.R")
txt_path <- "~/Library/Mobile Documents/com~apple~CloudDocs/Data/household_power_consumption.txt"
power <- eda_pc1_load_data(txt_path)

  
# 2. Making plot 4

 ## setting 2 rows and 2 columns with par
 par(mfrow = c(2,2))
 
 ## Plot 1
 with(power, {
   plot(DateTime, Global_active_power, type = "l",
        xlab="", ylab = "Global Active Power")
 })
 
 ## Plot 2
 with(power, {
   plot(DateTime, Voltage, type = "l",
        xlab = "datetime",
        ylab = "Voltage")
 })
 
 ## Plot 3
 with(power, {
   plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab="", 
        ylab="Energy sub metering", ylim=c(0,38))
   par(new = TRUE)
   plot(DateTime, Sub_metering_2, type = "l", col = "red", xlab="", 
        ylab="Energy sub metering", ylim=c(0,38))
   par(new = TRUE)
   plot(DateTime, Sub_metering_3, type = "l", col = "blue", xlab="", 
        ylab="Energy sub metering",  ylim=c(0,38))
 })
 legend(x = "topright", y = 38, 
        legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"), lty = 1, bty = "n", xjust=1,
        seg.len = 1)
 
 ## Plot 4
 with(power, {
   plot(DateTime, Global_reactive_power, type = "l",
        xlab = "datetime",
        ylab = "Global_reactive_power")
 })
 
 par(mfrow = c(1,1))
 

# 3. Saving plot as PNG file

  ## Copying device to PNG file
  dev.copy(png, "plot4.png")
  
  ## Closing device
  dev.off()
