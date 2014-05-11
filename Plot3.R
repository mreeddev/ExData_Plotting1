##read the data in from the txt file
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## get the specific dates required for the project
sepc <- epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

## convert columns to numeric
sepc$Sub_metering_1 <- as.numeric(as.character(sepc$Sub_metering_1))

##convert character date and time to POSIX
sepc.time <- strptime(paste(datSub$Date, datSub$Time), format='%d/%m/%Y %H:%M:%S')

##create plot
plot(sepc.time,sepc$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")

##add metering 1
lines(d.t, sepc$Sub_metering_1,col="black")

##add metering 2
lines(d.t, sepc$Sub_metering_2,col="red")

##add metering 3
lines(d.t, sepc$Sub_metering_3,col="blue")

##add the legend
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("black", "red", "blue"),lty=1)

##copy the plot to the device file
dev.copy(png,filename="plot3.png",width=480,height=480)

dev.off()
