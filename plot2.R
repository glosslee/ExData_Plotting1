## Coursera: Exploratory Data Analysis
## Date: 5/7/2015 by GL
## Week I, Homework I. Draw plots based on an electric power consumption table
## Part II.

plot2 <- function() {
        ## Read the data from the raw file
        ## Convert the missing values "?" into NA
        ## Seperate data into 9 columns
        ## Set the first row as the header
        epcData <- read.table(file = "./exdata_data_household_power_consumption/household_power_consumption.txt", 
                              sep = ";", na.string = "?", header = TRUE)
        
        ## Convert Date into "date" class
        ## Subset data at particular dates
        epcData$Date <- as.Date(epcData$Date, "%d/%m/%Y")
        dateCheck <- epcData$Date == "2007-02-01" | epcData$Date == "2007-02-02"
        dataSel <- subset(epcData, dateCheck)
        
        ## Convert the Time column to "time" class
        ## The "summer time" need to be consider during the convertion
        dataSel$Time <- strptime(dataSel$Time,"%H:%M:%S")
        date.gap <- as.Date(Sys.Date()) - dataSel$Date
        date.gap <- as.numeric(date.gap)
        dataSel$Time <- dataSel$Time - 86400 * date.gap + 3600
        
        ## Draw histogram of global active power
        ## Save it as a .png file
        png(file = "plot1.png", width = 480, height = 480, units = "px")
        plot(x = dataSel$Time, y = dataSel$Global_active_power, 
             ylab = "Global Active Power (kilowatts)")
        dev.off()
        
}