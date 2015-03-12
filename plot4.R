Sys.setlocale(category="LC_TIME",local="USA")
data<-read.csv("household_power_consumption.txt",sep=";")
good<-data$Date=="1/2/2007"|data$Date=="2/2/2007"
subdata<-data[good,]
subdata$DateTime<-paste(subdata$Date,subdata$Time)
subdata$DateTime<-strptime(subdata$DateTime,"%d/%m/%Y %H:%M:%S")
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))
subdata$Voltage<-as.numeric(as.character(subdata$Voltage))
subdata$Global_reactive_power<---as.numeric(as.character(subdata$Global_reactive_power))

png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2)) 
plot(subdata$DateTime,subdata$Global_active_power,type="l",
xlab="",
ylab="Global Active Power")

plot(subdata$DateTime,subdata$Voltage,type="l",
xlab="datatime",
ylab="Voltage")

plot(subdata$DateTime,subdata$Sub_metering_1,col="black",type="l",
ylim=range(subdata$Sub_metering_1),
xlab="",
ylab="Eneergy sub metering")
par(new=TRUE)
plot(subdata$DateTime,subdata$Sub_metering_2,col="red",type="l",
ylim=range(subdata$Sub_metering_1),
xlab="",
ylab="")
par(new=TRUE)
plot(subdata$DateTime,subdata$Sub_metering_3,col="blue",type="l",
ylim=range(subdata$Sub_metering_1),
xlab="",
ylab="")
legend("topright",pch="¡ª¡ª",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subdata$DateTime,subdata$Global_reactive_power,type="l",
xlab="datatime",
ylab="Global_reactive_power")

dev.off()
