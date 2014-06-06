## Read in data
power <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", stringsAsFactors = F)

## Subset data
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

## Change Date column to a date object
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## Combine Date and Time columns to create a combination POSIXct column
power$dateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

## Open device
png(file = "plot2.png")

## Create graph
with(power, plot(dateTime, Global_active_power, type="l",
                  ylab = "Global Active Power (kilowatts)", xlab=""))

## Close device
dev.off()