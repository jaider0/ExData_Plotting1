# Exploratory Data Analysis - Project 1 - Electric Power Consumption PLOTs
# Plot 2

## Read Electric Power Consumption Data, format dates and times

ds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
ds$Time <- strptime(paste(ds$Date, ds$Time), tz = "UTC", format = "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date, format = "%d/%m/%Y")

## Select dates 2007-02-01 and 2007-02-02

ds_plot <- ds[ds$Date == "2007-02-01" | ds$Date == "2007-02-02", ]

## Plot Graphs to PNG Device

png("ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")
with(ds_plot, plot(Time, Global_active_power, type = "l", main = "", 
                   xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
