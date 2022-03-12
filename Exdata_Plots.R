#Set working directory and Downloaded file

#read txt file

      hps <- read.csv("household_power_consumption.txt", sep = ";", 
                      stringsAsFactors = FALSE)

#Change classes of Date and Time variables
      
      hps$Date <- as.Date(hps$Date, format = "%d/%m/%Y")
      hps$DateTime <- strptime(paste(hps$Date,hps$Time),
                      format = "%Y-%m-%d %H:%M:%S")

#Choose data from "2007-2-1" to "2007-2-2"
      
      hps <- hps[hps$Date >= "2007-2-1" & hps$Date <= "2007-2-2",]
      
#Change classes of Data's 3:8 columns
      
      hps[,3] <- as.numeric(hps[,3])
      hps[,4] <- as.numeric(hps[,4])
      hps[,5] <- as.numeric(hps[,5])
      hps[,6] <- as.numeric(hps[,6])
      hps[,7] <- as.numeric(hps[,7])
      hps[,8] <- as.numeric(hps[,8])
      
#Constructing Plot1
      
      with(hps, hist(Global_active_power, xlab = "Global Active Power(kilowatts)", 
                     col = "red", main = "Global Active Power"))
      
#Save plot1 to a PNG file
      
      dev.copy(device = png, width = 480, height = 480, file = "Plot1.png")
      
#Constructing Plot2
      
      with(hps, plot(DateTime, Global_active_power, type = "l", xlab = "", 
                     ylab = "Global Active Power (kilowatts)", xaxt = "n"))
      axis(side = 1, at = c(as.numeric(hps$DateTime[1]), 
                            as.numeric(hps$DateTime[1441]), 
                            as.numeric(hps$DateTime[2880])),
           labels = c("Thu","Fri","Sat"))
      
#Save plot2 to a PNG file
      
      dev.copy(device = png, width = 480, height = 480, file = "Plot2.png")      

#Constructing Plot3
      
      with(hps, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n", xlab = "", 
                     ylab = "Energy sub metering"))
      axis(side = 1, at = c(as.numeric(hps$DateTime[1]), 
                            as.numeric(hps$DateTime[1441]), 
                            as.numeric(hps$DateTime[2880])), 
           labels = c("Thu","Fri","Sat"))
      with(hps, lines(DateTime, Sub_metering_1))
      with(hps, lines(DateTime, Sub_metering_2, col = "red"))
      with(hps, lines(DateTime, Sub_metering_3, col = "blue"))
      legend("topright", lty = 1, col=c("black", "red", "blue"), 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      

#Save plot3 to a PNG file
      
      dev.copy(device = png, width = 480, height = 480, file = "Plot3.png")      

#Constructing Plot4
      
      par(mfrow = c(2,2))
      
#Plot at top left
      
      with(hps, plot(DateTime, Global_active_power, type = "l", xlab = "",
                             ylab = "Global Active Power", xaxt = "n"))
      axis(side = 1, at = c(as.numeric(hps$DateTime[1]),
                            as.numeric(hps$DateTime[1441]),
                            as.numeric(hps$DateTime[2880])),labels = c("Thu","Fri","Sat"))
      
#Plot at top right
      
      with(hps, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage",
                             xaxt = "n"))
      axis(side = 1, at = c(as.numeric(hps$DateTime[1]),
                            as.numeric(hps$DateTime[1441]),
                            as.numeric(hps$DateTime[2880])),labels = c("Thu","Fri","Sat"))
    
#Plot at bottom left
      
      with(hps, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                             xlab = "", ylab = "Energy sub metering"))
      axis(side = 1, at = c(as.numeric(hps$DateTime[1]),
                            as.numeric(hps$DateTime[1441]),
                            as.numeric(hps$DateTime[2880])),labels = c("Thu","Fri","Sat"))
      with(hps, lines(DateTime, Sub_metering_1))
      with(hps, lines(DateTime, Sub_metering_2, col = "red"))
      with(hps, lines(DateTime, Sub_metering_3, col = "blue"))
      legend("topright",lty = 1, col = c("black","red","blue"),
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      
#Plot at bottom right
      
      with(hps, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", 
                             ylab = "Global_reactive_power", xaxt = "n"))
      axis(side = 1, at = c(as.numeric(hps$DateTime[1]),
                            as.numeric(hps$DateTime[1441]),
                            as.numeric(hps$DateTime[2880])),
           labels = c("Thu","Fri","Sat"))
     
#Save Plot4
      
      dev.copy(device = png, width = 480, height = 480, file = "Plot4.png")      
      
dev.off()
