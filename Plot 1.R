data.file<-"household_power_consumption.txt"

power.use<-read.table(data.file,nrows=70000, sep=";",header=TRUE,quote="",na.strings="?",
                      colClasses=rep(c("character","numeric"),c(2, 7)))
power.use<-power.use[power.use$Date=="1/2/2007"|power.use$Date=="2/2/2007",]

power.use<-within(power.use,{
  Time<-strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")
  Date<-as.Date(Date,"%d/%m/%Y")
})

png(file="plot1.png",width=480,height=480)
hist(power.use$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kW)")
dev.off()
