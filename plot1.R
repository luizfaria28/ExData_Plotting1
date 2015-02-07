
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# download.file(fileUrl, destfile = "./gdp.csv", method = "curl")
# gdp_data <- read.csv("./gdp.csv",stringsAsFactors=FALSE)

require(sqldf)
file <- c("./household_power_consumption.txt")
data <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, 
     col="red",
     main = "Global Active Power",
     xlab="Global Active Power (kilowatt)")

dev.off()

