setwd('C:/COURSERA/4.Exploratory Data Analysis/Data')
# Load data
df <- read.csv('household_power_consumption.txt',sep = ';',header = T,stringsAsFactors = F,na.strings = '?',
               colClasses = c('character','character','numeric','numeric','numeric','numeric',
                              'numeric','numeric','numeric'))
# transform char to date
library(lubridate)
df$Date <- dmy(df$Date)
# filter data
library(dplyr)
dfres <- dplyr::filter(df,Date=='2007-02-01'|Date=='2007-02-02')
dfres$DateTime <- as.POSIXlt(paste(dfres$Date,dfres$Time))

# plot data
png('C:/Users/Сергей/Coursera/Explore/Week_1/ExData_Plotting1/plot4.png',width = 480,
    height = 480)
par(mar = c(4,4,2,2),mfrow = c(2,2))

plot(x = dfres$DateTime,y = dfres$Global_active_power,
     ylab = 'Global Active Power',type = 'l',xlab = '')
plot(x = dfres$DateTime,y = dfres$Voltage,
     ylab = 'Voltage',type = 'l',xlab = 'datetime')
plot(x = dfres$DateTime,y = dfres$Sub_metering_3, type = 'n',
     ylab = 'Energy sub metering', xlab = '',ylim = c(0,40))
points(x = dfres$DateTime,y=dfres$Sub_metering_1,type = 'l')
points(x = dfres$DateTime,y=dfres$Sub_metering_2,type = 'l',col='red')
points(x = dfres$DateTime,y=dfres$Sub_metering_3,type = 'l',col='blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'),lty = 1,bty = 'n')
plot(x = dfres$DateTime,y = dfres$Global_reactive_power,
     ylab = 'Global_reactive_power',type = 'l',xlab = 'datetime')

dev.off()
