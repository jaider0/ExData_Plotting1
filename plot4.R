# Exploratory Data Analysis - Project 1 - Electric Power Consumption PLOTs
# Plot 4

## Read Electric Power Consumption Data, format dates and times

ds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
ds$datetime <- strptime(paste(ds$Date, ds$Time), tz = "UTC", format = "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date, format = "%d/%m/%Y")

## Select dates 2007-02-01 and 2007-02-02

ds_plot <- ds[ds$Date == "2007-02-01" | ds$Date == "2007-02-02", ]

## Plot Graphs to PNG Device

png("ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2), mar = c(5, 5, 1, 1))

### Graph 1
with(ds_plot, plot(datetime, Global_active_power, type = "l", main = "", 
                   xlab = "", ylab = "Global Active Power (kilowatts)"))

### Graph 2
with(ds_plot, plot(datetime, Sub_metering_1, type = "l", col = "black", 
                   main = "", xlab = "", ylab = "Energy sub metering"))
with(ds_plot, lines(datetime, Sub_metering_2, col = "red"))
with(ds_plot, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, box.lty = 0, col = c("black", "red", "blue"), 
       legend = names(ds_plot[7:9]))

### Graph 3
with(ds_plot, plot(datetime, Voltage, type = "l"))

### Graph 4
with(ds_plot, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
