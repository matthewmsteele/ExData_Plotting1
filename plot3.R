## Read input file

input <- read.csv("household_power_consumption.txt",sep=";"
                  ,colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")

## formatting data and constructing data frame

dates <- strptime(paste(input[,1],input[,2]),format="%d/%m/%Y %H:%M:%S")
date_index <- (dates >= strptime("2007-02-01",format="%Y-%m-%d")) & 
        (dates < strptime("2007-02-03",format="%Y-%m-%d"))

pc_data <- cbind(data.frame(Date=dates[date_index]),input[date_index,3:9])

## constructing plot

png(file="plot3.png")

plot(pc_data$Date,pc_data$Sub_metering_1,type="l",
     ylab="Energy sub metering",xlab="")
lines(pc_data$Date,pc_data$Sub_metering_2,col="red")
lines(pc_data$Date,pc_data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
