setwd('./Documents/datascience/Exploratory_data_analysis/Week1/Week1_assignment')

# Download data from source
zip_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(zip_url,'household_power_consumption.zip')
unzip('dataset.zip')

# Read data from source knowing raw data format
raw_data <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings = '?')

# Subset data
data <- raw_data[raw_data$Date=="1/2/2007" | raw_data$Date=="2/2/2007",]

# Save memory by deleting unnecessary data
rm(raw_data)

# convert date strings to date class
data.selected$Date <- as.Date(data.selected$Date, format="%d/%m/%Y")

# generate plot
par(new=F)
par(mfrow=c(2,2))

plot(
  as.numeric(data$Global_active_power),
  type="l",
  ylab="Global Active Power",
  xlab="",
  axes=FALSE
)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
box(lty = 1, col = 'black')

plot(as.numeric(data$Voltage),
  type="l",
  ylab="voltage",
  xlab="datetime",
  axes=FALSE
)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(234,238,240,242),labels=c("234","238","240","242"))
box(lty = 1, col = 'black')

plot(1:nrow(data),
  as.numeric(data$Sub_metering_1),
  ylab="Energy sub metering",
  xlab="",
  type="l",
  col="black",
  axes=FALSE
)

par(new=T)

plot(
  as.numeric(data$Sub_metering_2),
  col="red",
  type="l",
  axes=FALSE,
  ylim=c(0,40),
  xlab="",
  ylab=""
)

par(new=T)

plot(
  as.numeric(data$Sub_metering_3),
  col="blue",
  type="l",
  axes=FALSE,
  ylim=c(0,40),
  xlab="",
  ylab=""
)

axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2, at = c(0,10,20,30),labels = c("0","10","20","30"))

legend(
  "topright",
  legend=c("sub-metering1","sub-metering2","sub-metering3"),
  col=c("black","red","blue"),
  lty=c(1,1,1),
  lwd=2
)

box(lty = 1, col = 'black')

par(new=F)

plot(
  as.numeric(data$Global_reactive_power),
  type="l",
  ylab="Global Reactive Power",
  xlab="datetime",
  axes=FALSE
)

axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0.1,0.2,0.3,0.4),c("0.1","0.2","0.3","0.4"))
box(lty = 1, col = 'black')

# save plot to png file
dev.copy(png,"plot4.png")

# close device
dev.off()
