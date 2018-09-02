library(readr)
household_power_consumption = read_delim("~/datasciencecoursera/Exploratory Data Analysis/household_power_consumption.txt",
                                          ";", escape_double = FALSE, trim_ws = TRUE)
Feb1_2_Power_Consump = subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"))

png(filename = "plot1.png", width = 480, height = 480, bg = "white")
hist(Feb1_2_Power_Consump$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


