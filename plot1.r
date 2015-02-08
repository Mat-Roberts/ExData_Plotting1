data <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data2 <- subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
png(file="plot1.png",width=480,height=480)
hist(data2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()