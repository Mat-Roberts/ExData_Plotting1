data <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?")

data$Date <- as.Date(data$Date, '%d/%m/%Y')
data2 <- subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
data2$datetime <- paste(as.character(data2$Date),data2$Time,sep=" ")
data2$datetime <- strptime(data2$datetime,format="%Y-%m-%d %H:%M:%S") 
png(file="plot2.png",width=480,height=480)
plot(data2$datetime, data2$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()