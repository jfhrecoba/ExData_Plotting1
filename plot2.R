data<-read.csv("household_power_consumption.txt",sep=";")
good<-data$Date=="1/2/2007"|data$Date=="2/2/2007"
subdata<-data[good,]
subdata$DateTime<-paste(subdata$Date,subdata$Time)
subdata$DateTime<-strptime(subdata$DateTime,"%d/%m/%Y %H:%M:%S")
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
png(filename="plot2.png",width=480,height=480)
plot(subdata$DateTime,subdata$Global_active_power,type="l",
xlab="",
ylab="Global Active Power (kilowatts)")
dev.off()
