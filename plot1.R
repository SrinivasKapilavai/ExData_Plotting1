## setwd("D:/Data Science/4. Exploratory Data Analysis/Course Project 1")

library(dplyr)

## Reading total data 
powerConsumption <- read.table("data/household_power_consumption.txt", 
                               header = TRUE, sep =";", na.strings="?", 
                               check.names=F, stringsAsFactors=FALSE, 
                               comment.char="", quote='\"')

## Filtering data based on given range of dates converting date and time formats
powerConsumption <- powerConsumption %>% 
                    mutate(Date=as.Date(Date, format="%d/%m/%Y")) %>% 
                    filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>%   
                    mutate(dateTime = as.POSIXct(
                                    paste(Date, 
                                          Time, 
                                          sep=" " 
                                          ),
                                   format="%Y-%m-%d %H:%M:%S"))

## Making Plot 1
png(file="plot1.png")
hist(powerConsumption$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power",
     col="red")

## Saving to file
## dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()