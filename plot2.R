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
png('C:/Users/Сергей/Coursera/Explore/Week_1/ExData_Plotting1/plot2.png',width = 480,
    height = 480)
plot(x = dfres$DateTime,y = dfres$Global_active_power,
     ylab = 'Global Active Power (kilowatts)',type = 'l',xlab = '')

dev.off()
