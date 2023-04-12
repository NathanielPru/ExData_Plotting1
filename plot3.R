
unzip("exdata_data_household_power_consumption.zip")

powerConsumption <- read.table(
  "household_power_consumption.txt"
  ,sep = ";")

colnames(powerConsumption) <- powerConsumption[1,]
powerConsumption<-powerConsumption[-1,]
class(powerConsumption$dateTime)

powerConsumption$dateTime <- paste(powerConsumption$Date,powerConsumption$Time,
                                   sep = " ")
powerConsumption$dateTime<-strptime(powerConsumption$dateTime, 
                                    format = "%d/%m/%Y %H:%M:%S")

powerConsumption$Date<-as.Date(powerConsumption$Date, format = "%d/%m/%Y")

#Extract the specific data we will use
feb2Days <- powerConsumption[powerConsumption$Date >= "2007-02-01" & 
                               powerConsumption$Date <= "2007-02-02",]


feb2Days$Sub_metering_1<-as.numeric(feb2Days$Sub_metering_1, na.rm=TRUE)
feb2Days$Sub_metering_2<-as.numeric(feb2Days$Sub_metering_2, na.rm=TRUE)
feb2Days$Sub_metering_3<-as.numeric(feb2Days$Sub_metering_3, na.rm=TRUE)


png(filename = "plot3.png")

plot(feb2Days$dateTime,feb2Days$Sub_metering_1, type = "l"
     ,xlab="",ylab = "Energy sub metering")
lines(feb2Days$dateTime,feb2Days$Sub_metering_2, col="red")
lines(feb2Days$dateTime,feb2Days$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col = c("black", "red", "blue"), lty =c(1,1,1))

dev.off()