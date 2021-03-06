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
with(data, hist(
  Global_active_power,
  col="red", 
  breaks=15,
  xlab="Global Active Power (kilowatts)",
  main="Global Active Power",
  ylim=c(0,1200)
  ))

# save plot to png file
dev.copy(png,'plot1.png',  width = 480, height = 480)

# close device
dev.off()




