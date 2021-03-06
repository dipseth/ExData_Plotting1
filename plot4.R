library(data.table)
setwd("C:/Users/srivers/ExData_Plotting1")
all_data<-data.table(fread("C:/Users/srivers/Desktop/household_power_consumption.txt",sep=";"))
all_data$Date<-as.Date(all_data$Date,format = "%d/%m/%Y")
data1<-all_data[Date %between% c('2007-02-01','2007-02-02'),]
data1<-as.data.frame(data1)
data1$Time<-strptime(paste(data1$Date,data1$Time),format='%Y-%m-%d %H:%M:%S')


#rm(list=c("all_data"))
par(mfrow=c(2,2))

plot(data1$Time,data1$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(data1$Time,data1$Voltage,type="l",xlab="datetime",ylab="Voltage")




plot(data1$Time,data1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data1$Time,data1$Sub_metering_2,type="l",col="red")
lines(data1$Time,data1$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),pch="-")


plot(data1$Time,data1$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()




