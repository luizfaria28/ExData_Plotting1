
require(sqldf)
file <- c("./household_power_consumption.txt")
data <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

#Sys.setlocale("LC_TIME", "English")
# defaults write org.R-project.R force.LANG en_US.UTF-8
system("defaults write org.R-project.R force.LANG en_US.UTF-8")

data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")

#xarray <- data.frame(data$Date.Time, data$Date.Time, data$Date.Time)
#yarray <- data[,c(7,8,9)]
#matplot(xarray, yarray, type = "l")

png(filename = "plot3.png", width = 480, height = 480)

plot(data$Date.Time, data$Sub_metering_1, type = "l", col="black",
     ylab="Energy sub metering",
     xlab="")
lines(data$Date.Time, data[,8], type = "l", col="red")
lines(data$Date.Time, data[,9], type = "l", col="blue")

legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .75
)

dev.off()

