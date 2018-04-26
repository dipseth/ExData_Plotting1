library(data.table)
setwd("C:/Users/srivers/ExData_Plotting1")
all_data<-data.table(fread("C:/Users/srivers/Desktop/household_power_consumption.txt",sep=";"))
all_data$Date<-as.Date(all_data$Date,format = "%d/%m/%Y")

data<-all_data[Date %between% c('2007-02-01','2007-02-02'),]

rm(list=c("all_data"))

hist(as.numeric(data$Global_active_power),col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()




