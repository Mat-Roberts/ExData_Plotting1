data <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?")

data$Date <- as.Date(data$Date, '%d/%m/%Y')

data2 <- subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")

data2$datetime <- paste(as.character(data2$Date),data2$Time,sep=" ")
data2$datetime <- strptime(data2$datetime,format="%Y-%m-%d %H:%M:%S") 

yrange<-range(c(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3))

png(file="plot3.png",width=480,height=480)
plot(data2$datetime,data2$Sub_metering_1,ylim=yrange,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(data2$datetime,data2$Sub_metering_2,col="red")
lines(data2$datetime,data2$Sub_metering_3,col="blue")
legend("topright",colnames(data2)[7:9],col=c("black","red","blue"),lwd=1)
dev.off()