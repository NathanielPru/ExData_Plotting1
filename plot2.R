
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


feb2Days$Global_active_power<-as.numeric(feb2Days$Global_active_power, na.rm=TRUE)



png(filename = "plot2.png")

plot(feb2Days$dateTime,feb2Days$Global_active_power, type = "l"
     ,xlab="",ylab = "Global Active Power (kilowatt)")

dev.off()