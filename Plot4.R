##read the data in from the txt file
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## get the specific dates required for the project
sepc <- epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

## convert columns to numeric
sepc$Sub_metering_1 <- as.numeric(as.character(sepc$Sub_metering_1))
sepc$Global_reactive_power <- as.numeric(as.character(sepc$Global_reactive_power))

##convert character date and time to POSIX
d.t <- strptime(paste(datSub$Date, datSub$Time), format='%d/%m/%Y %H:%M:%S')

##create plot
par(mfrow=c(2,2))
par(mar=c(2,2,2,2))

plot(d.t,sepc$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(d.t,sepc$Voltage, type="l",xlab="datetime",ylab="Voltage")

plot(d.t,sepc$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
lines(d.t, sepc$Sub_metering_1,col="black")
lines(d.t, sepc$Sub_metering_2,col="red")
lines(d.t, sepc$Sub_metering_3,col="blue")
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("black", "red", "blue"),lty=1)

plot(d.t,sepc$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,filename="plot4.png",width=480,height=480)

dev.off()
