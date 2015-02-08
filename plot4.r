#data <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
#data$Date <- as.Date(data$Date, '%d/%m/%Y')
#data2 <- subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
#data2$DateTime <- paste(as.character(data2$Date), data2$Time, sep= " ")
#data2$DateTime <- strptime(data2$DateTime,format="%Y-%m-%d %H:%M:%S")
png(file="plot4.png",width=480,height=480)
par(mfcol=c(2,2))

plot(data2$DateTime,data2$Global_active_power, xlab="", ylab="Global Active Power", type="l",col="black")

plot(data2$DateTime,data2$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l",col="black")
lines(data2$DateTime,data2$Sub_metering_2,type="l",col="red")
lines(data2$DateTime,data2$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

plot(data2$DateTime,data2$Voltage, xlab="datetime", ylab="Voltage", type="l",col="black")

plot(data2$DateTime,data2$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l",col="black")

dev.off()