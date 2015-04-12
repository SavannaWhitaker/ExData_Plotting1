data.file<-"household_power_consumption.txt"

power.use<-read.table(data.file,nrows=70000, sep=";",header=TRUE,quote="",na.strings="?",
                      colClasses=rep(c("character","numeric"),c(2, 7)))
power.use<-power.use[power.use$Date=="1/2/2007"|power.use$Date=="2/2/2007",]

power.use<-within(power.use,{
  Time<-strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")
  Date<-as.Date(Date,"%d/%m/%Y")
})

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#plot1
plot(power.use$Time,power.use$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#plot2
plot(power.use$Time,power.use$Voltage,type="l",xlab="datetime",ylab="voltage")
#plot3
plot(power.use$Time,power.use$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(power.use$Time,power.use$Sub_metering_2,col="red")
lines(power.use$Time,power.use$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot4
plot(power.use$Time,power.use$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
