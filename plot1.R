
unzip("exdata_data_household_power_consumption.zip")

powerConsumption <- read.table(
  "household_power_consumption.txt"
  ,sep = ";")

colnames(powerConsumption) <- powerConsumption[1,]
powerConsumption<-powerConsumption[-1,]
class(powerConsumption$Date)

powerConsumption$Date<-as.Date(powerConsumption$Date, format = "%d/%m/%Y")

#Extract the specific data we will use
feb2Days <- powerConsumption[powerConsumption$Date >= "2007-02-01" & 
                               powerConsumption$Date <= "2007-02-02",]


feb2Days$Global_active_power<-as.numeric(feb2Days$Global_active_power, na.rm=TRUE)

png(filename = "plot1.png")
  hist(feb2Days$Global_active_power, col = "red"
     ,xlab = "Global Active Power (kilowatt)", main = "Global Active Power")
dev.off()

