##read the data in from the txt file
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## get the specific dates required for the project
sepc <- epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

## convert columns to numeric
sepc$Global_active_power <- as.numeric(as.character(sepc$Global_active_power))

##convert character date and time to POSIX
sepc.time <- strptime(paste(datSub$Date, datSub$Time), format='%d/%m/%Y %H:%M:%S')

##create plot
plot(sepc.time,sepc$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,filename="plot2.png",width=480,height=480)

dev.off()



