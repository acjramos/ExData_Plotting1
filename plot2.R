##Download the file
setwd("~/work/coursera/Week1EDA/ExData_Plotting1")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")

##Read the file and extract Feb1 and Feb2 of 2007
completedata <- read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F)
data <- completedata[completedata$Date=="1/2/2007"|completedata$Date=="2/2/2007",]

##Format the Time and Date variables
data$Time <- strptime(x=data$Time,format="%H:%M:%S")
data$Time[1:1440] <- format(data$Time[1:1440],"2007-02-01 %H:%M:%S")
data$Time[1440:2880] <- format(data$Time[1440:2880],"2007-02-02 %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

##Second Plot as .png
png(file="plot2.png")
plot(data$Time,as.numeric(data$Global_active_power),type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
