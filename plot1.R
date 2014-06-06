## Read in data
power <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?", stringsAsFactors = F)

## Subset data
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

## Change Date column to a date object
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## Combine Date and Time columns to create a combination POSIXct column
power$dateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

## Open device
png(file="plot1.png")

## Create graph
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")

## Turn device off
dev.off()