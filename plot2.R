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
                    mutate(dateTime = as.POSIXct(paste(Date, 
                                                       Time, 
                                                       sep=" " 
                                                        ),
                                                format="%Y-%m-%d %H:%M:%S"))


## Making Plot 2
png(file="plot2.png")
plot(powerConsumption$dateTime, powerConsumption$Global_active_power,
     type="l", ylab="Global Active Power (kilowatts)", xlab="")
                           
## Saving to file
## dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()