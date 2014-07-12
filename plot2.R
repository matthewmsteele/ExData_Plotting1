## Read input file

input <- read.csv("household_power_consumption.txt",sep=";"
                  ,colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")

## formatting data and constructing data frame

dates <- strptime(paste(input[,1],input[,2]),format="%d/%m/%Y %H:%M:%S")
date_index <- (dates >= strptime("2007-02-01",format="%Y-%m-%d")) & 
        (dates < strptime("2007-02-03",format="%Y-%m-%d"))

pc_data <- cbind(data.frame(Date=dates[date_index]),input[date_index,3:9])

## constructing plot

png(file="plot2.png")

plot(pc_data$Date,pc_data$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

dev.off()
