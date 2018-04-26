library(data.table)
setwd("C:/Users/srivers/ExData_Plotting1")
all_data<-data.table(fread("C:/Users/srivers/Desktop/household_power_consumption.txt",sep=";"))
all_data$Date<-as.Date(all_data$Date,format = "%d/%m/%Y")
data1<-all_data[Date %between% c('2007-02-01','2007-02-02'),]
data1<-as.data.frame(data1)
data1$Time<-strptime(paste(data1$Date,data1$Time),format='%Y-%m-%d %H:%M:%S')


#rm(list=c("all_data"))




plot(data1$Time,as.numeric(data1$Global_active_power),type='l',ylab= "Global Active Power (kilowatts)",xlab='' )
dev.copy(png,file="plot2.png")
dev.off()




