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

##Fourth Plot as .png
png(file="plot4.png")
par(mar=c(4,4,2,2),mfcol=c(2,2))
plot(data$Time,as.numeric(data$Global_active_power), type="l",xlab="",
     ylab="Global Active Power")
plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_1)
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),cex=0.6,bty="n")
plot(data$Time,data$Voltage,type="l",ylab="Voltage")
plot(data$Time,data$Global_reactive_power,type="l",ylab="Global_reactive_power")
dev.off()

