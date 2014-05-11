##read the data in from the txt file
epc <- read.table("household_power_consumption.txt",sep=";")

##split into matrix list
sepc <- split(epc,f=epc[,1])

## get the specific dates required for the project
mepc1 <- as.matrix(sepc$"2/1/2007")
mepc2 <- as.matrix(sepc$"2/2/2007")
mepc <- rbind(mepc1,mepc2)

##convert to data frame...cannot have multiple column types in matrix
depc <- as.data.frame(mepc)

## add a DateasChr column as character and set the value to paste date and time
depc <- cbind(depc,paste(as.character(depc[,1]),as.character(depc[,2])))

##add a Datetime column as POSIX
depct <- as.POSIXlt(strptime(depc[,10], "%m/%d/%Y %H:%M:%S"))
depc <- cbind(depc,depct)

##set the column names
colnames(mepc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3","DateasChr","Datetime")

##replace the ? with NA
depct <- as.data.frame( lapply(depc, function(x) if(x=="?") x="NA" else x)  )

##convert the character columns to numeric
depct$Global_active_power <- as.numeric(depct$Global_active_power)
depct$Global_reactive_power <- as.numeric(depct$Global_reactive_power)
depct$Voltage <- as.numeric(depct$Voltage)
depct$Global_intensity <- as.numeric(depct$Global_intensity)
depct$Sub_metering_1 <- as.numeric(depct$Sub_metering_1)
depct$Sub_metering_2 <- as.numeric(depct$Sub_metering_2)
depct$Sub_metering_3 <- as.numeric(depct$Sub_metering_3)

## #############################################
##Data is tidy

##Plot 1
with(depct, hist(depct$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowats)",ylab="Frequency",col="red") )
dev.copy(png,filename="plot1.png",width=480,height=480)
dev.off()









