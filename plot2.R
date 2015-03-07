##Exploratory Data Analysis
##Project 1

#Plot 2

## Load data
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "exdata%2Fdata%2Fhousehold_power_consumption.zip")
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = "household_power_consumption")

path <- "household_power_consumption/household_power_consumption.txt"
hpc <- read.table(path,header=TRUE,sep=";",colClasses="character")

##convert to date and time classes
hpc[,1] <-as.Date(hpc$Date,"%d/%m/%Y")

##create subset for 2007-02-01 and 2007-02-02
subhpc <- subset(hpc,hpc$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subhpc$DateTime <-as.POSIXct(paste(subhpc$Date,subhpc$Time),format="%Y-%m-%d %H:%M:%S")

##cast rest of columns as numeric
subhpc[,3] <- as.numeric(subhpc[,3])
subhpc[,4] <- as.numeric(subhpc[,4])
subhpc[,5] <- as.numeric(subhpc[,5])
subhpc[,6] <- as.numeric(subhpc[,6])
subhpc[,7] <- as.numeric(subhpc[,7])
subhpc[,8] <- as.numeric(subhpc[,8])
subhpc[,9] <- as.numeric(subhpc[,9])

##create plot 2
plot(subhpc$DateTime, subhpc[,3], type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

##convert to png
dev.copy(png,file="plot2.png")

##and close
dev.off()