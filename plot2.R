
require(sqldf)
file <- c("./household_power_consumption.txt")
data <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

#Sys.setlocale("LC_TIME", "English")
# defaults write org.R-project.R force.LANG en_US.UTF-8
system("defaults write org.R-project.R force.LANG en_US.UTF-8")

data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

plot(data$Date.Time, data$Global_active_power,type="l",
     ylab="Global Active Power (kilowatt)",
     xlab="")

dev.off()