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


## Making Plot 3
png(file="plot3.png")
with(powerConsumption,
     {  
        plot(dateTime, Sub_metering_1, 
                xlab="", ylab="Energy Sub Metering", type="n")
        lines(dateTime, Sub_metering_1, col="black")
        lines(dateTime, Sub_metering_2, col="red")
        lines(dateTime, Sub_metering_3, col="blue")
    }
)

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Submetering_1", "Submetering_2", "Submetering_3"))

## Saving to file
## dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()