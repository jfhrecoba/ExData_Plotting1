data<-read.csv("household_power_consumption.txt",sep=";")
good<-data$Date=="1/2/2007"|data$Date=="2/2/2007"
subdata<-data[good,]
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
png(filename="plot1.png",width=480,height=480)
hist(subdata$Global_active_power,
main="Global Active Power",
xlab="Global Active Power (kilowatts)",
col="red")
dev.off()
