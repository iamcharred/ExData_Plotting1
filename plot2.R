op <- par(no.readonly = TRUE)
data.file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
indate <- ( data.file[,1] == "1/2/2007" ) | (data.file[,1] == "2/2/2007")
data.sub <- subset(data.file, indate)
data.dated <- data.sub
data.dated[,1] <- as.Date(data.dated[,1], "%d/%m/%Y")
# head(subset(data.file, data.file[,1] == "1/2/2007"))
datetime <- paste(as.Date(data.dated[,1], "%d/%m/%Y"), data.dated[,2])
date.strip <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
# data.dated[,10] <- date.strip
# hist(data.dated$Global_active_power)
data.file <- c()
date.posct <- as.POSIXct(datetime)
data.dated[,10] <- date.posct
plot(data.dated[,10], data.dated$Global_active_power, type ="l", col="black", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()