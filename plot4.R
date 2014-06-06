## Read in data
power <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", stringsAsFactors = F)

## Subset data
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

## Change Date column to a date object
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## Combine Date and Time columns to create a combination POSIXct column
power$dateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

## Open Device
png(file = "plot4.png")

## Set multi-graph parameter
par(mfcol=c(2,2))

## Plot Graphs
with(power,{
        plot(dateTime, Global_active_power, type="l",
             ylab = "Global Active Power", xlab="")
        
        plot(dateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering"
             , xlab ="")
        lines(dateTime, Sub_metering_2, col="red", type="l")
        lines(dateTime, Sub_metering_3, col = "blue", type = "l")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
               , lty=c(1,1,1), col = c("black","red","blue"), bty="n", cex=1, y.intersp=.5)
        
        plot(dateTime, Voltage, type="l",
             ylab = "Voltage", xlab="datetime")
        
        plot(dateTime, Global_reactive_power, type="l",
             xlab="datetime")
})

##Close device
dev.off()