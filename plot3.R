# Exploratory Data Analysis - Project 1 - Electric Power Consumption PLOTs
# Plot 3

## Read Electric Power Consumption Data, format dates and times

ds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
ds$Time <- strptime(paste(ds$Date, ds$Time), tz = "UTC", format = "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date, format = "%d/%m/%Y")

## Select dates 2007-02-01 and 2007-02-02

ds_plot <- ds[ds$Date == "2007-02-01" | ds$Date == "2007-02-02", ]

## Plot Graphs to PNG Device

png("ExData_Plotting1/plot3.png", width = 480, height = 480, units = "px")
with(ds_plot, plot(Time, Sub_metering_1, type = "l", col = "black", 
                   main = "", xlab = "", ylab = "Energy sub metering"))
with(ds_plot, lines(Time, Sub_metering_2, col = "red"))
with(ds_plot, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(ds_plot[7:9]))
dev.off()
