# Exploratory Data Analysis - Project 1 - Electric Power Consumption PLOTs
# Plot 1

## Read Electric Power Consumption Data, format dates and times

ds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
ds$Time <- strptime(paste(ds$Date, ds$Time), tz = "UTC", format = "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date, format = "%d/%m/%Y")

## Select dates 2007-02-01 and 2007-02-02

ds_plot <- ds[ds$Date == "2007-02-01" | ds$Date == "2007-02-02", ]

## Plot Histogram to PNG Device

png("ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")
hist(ds_plot$Global_active_power, col = "red", main = "", xlab = "")
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
