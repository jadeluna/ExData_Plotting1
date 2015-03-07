##Exploratory Data Analysis
##Project 1

#Plot 4

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

##create plot 4
#set 2x2 grid for plots, filling across rows
par(mfrow = c(2,2))

#plot Global Active Power
plot(subhpc$DateTime, subhpc[,3], type = "l", xlab = " ", ylab = "Global Active Power")

#plot Voltage
plot(subhpc$DateTime, subhpc[,5], type = "l", xlab = "datetime", ylab = "Voltage")

#plot Energy sub metering
plot(subhpc$DateTime, subhpc[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(subhpc[,10],subhpc[,8],col="Red")
lines(subhpc[,10],subhpc[,9],col="Blue")
legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1, pt.cex = 0.6, cex = 0.6, bty = "n")

#plot Global_reactive_power
plot(subhpc$DateTime, subhpc[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##convert to png
dev.copy(png,file="plot4.png")

##and close
dev.off()