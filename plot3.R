library(readr)
household_power_consumption = read_delim("~/datasciencecoursera/Exploratory Data Analysis/household_power_consumption.txt",
                                         ";", escape_double = FALSE, trim_ws = TRUE)
Feb1_2_Power_Consump = subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"))
Feb1_2_Power_Consump$Datetime = paste(Feb1_2_Power_Consump$Date, Feb1_2_Power_Consump$Time) #new column in df with for "DateTime"
Feb1_2_Power_Consump$Datetime = strptime(Feb1_2_Power_Consump$Datetime, "%d/%m/%Y %H:%M:%S") #convert Datetime class from character to POSIXlt
Feb1_2_Power_Consump$Datetime = as.POSIXct(Feb1_2_Power_Consump$Datetime) #convert Datetime to POSIXct class to plot

png(filename = "plot3.png", width = 480, height = 480, bg = "white")
plot(Feb1_2_Power_Consump$Sub_metering_1~Feb1_2_Power_Consump$Datetime, type="l", 
     ylab="Energy sub metering", xlab="")
lines(Feb1_2_Power_Consump$Sub_metering_2~Feb1_2_Power_Consump$Datetime, type = "l", col = "red")
lines(Feb1_2_Power_Consump$Sub_metering_3~Feb1_2_Power_Consump$Datetime, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()