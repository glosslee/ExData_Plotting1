## Coursera: Exploratory Data Analysis
## Date: 5/7/2015 by GL
## Week I, Homework I. Draw plots based on an electric power consumption table

plot1 <- function() {
        ## Read the data from the raw file
        ## Convert the missing values "?" into NA
        ## Seperate data into 9 columns
        ## Set the first row as the header
        epcData <- read.table(file = "./exdata_data_household_power_consumption
                              /household_power_consumption.txt", sep = ";", 
                              na.string = "?", header = TRUE)
        
        ## Convert Date into "date" class
        ## Subset data at particular dates
        epcData$Date <- as.Date(epcData$Date, "%d/%m/%Y")
        dateCheck <- epcData$Date == "2007-02-01" | epcData$Date == "2007-02-02"
        dataSel <- subset(epcData, dateCheck)
        
        ## Draw histogram of global active power
        png(file = "plot1.png", width = 480, height = 480, units = "px")
        hist(dataSel$Global_active_power, col = "red",
             main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
        
}