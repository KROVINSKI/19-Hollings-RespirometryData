#install.packages("ggplot2")

library(ggplot2)

#Paul Code for plotting respirometry data together
#Set working directory
#setwd("Users\erin.tully\Desktop\Respirometry Trials\Calibration Trials")
# kept getting errors for how the pathname was importing 

setwd("C:/Users/erin.tully/Desktop/Respirometry Trials/Calibration Trials/Cali_trial_2")

fileNames <- dir(getwd(),pattern=".csv")
#Create empty output file for new files to go into
d <- NULL

#Create loop to go through all files and remove unnecessary columns
for (i in 1:length(fileNames)){
  dTemp <- read.csv(fileNames[i], header=TRUE, skip = 1, stringsAsFactors = FALSE)
  dTemp$file <- fileNames[i]
  d <- rbind(d, dTemp)
}
d$dateTime <- paste(d$Date, d$Time, sep = " ")
d$dateTime <- as.POSIXct(d$dateTime, format="%m/%d/%Y %H:%M:%S")

ggplot(d, aes(x = dateTime, y = Value, colour = file)) +
  geom_point(size = 1) +
  geom_smooth(method = "lm") +
  theme_bw()

##################################################################################

#Beginning of Trial A data analysis 

library(ggplot2)

setwd("C:/Users/erin.tully/Desktop/Respirometry Trials/Trial_A_6.4.2019")

fileNames <- dir(getwd(),pattern=".csv")
#Create empty output file for new files to go into
a <- NULL

#Create loop to go through all files and remove unnecessary columns
for (i in 1:length(fileNames)){
  aTemp <- read.csv(fileNames[i], header=TRUE, skip = 1, stringsAsFactors = FALSE)
  aTemp$file <- fileNames[i]
  a <- rbind(a, aTemp)
}
#adding in Date Time value to orginial function 
a$dateTime <- paste(a$Date, a$Time, sep = " ")
a$dateTime <- as.POSIXct(a$dateTime, format="%m/%d/%Y %H:%M:%S")

#chaning temperature from number to factor 
a$Temp <- as.factor(a$Temp)

#First attempt. Going for time v O2 level with mg/L as unit 
ggplot(a, aes(x = dateTime, y = Value, colour = file)) +
  geom_point(size = 1) +
  geom_smooth(method = "lm") +
  theme_bw()

#Graphing to show temperature data attempt 1 
ggplot(d, aes(x = dateTime, y = "Temp", colour = file)) +
  geom_line(size = 1) #+
  #geom_smooth(method = "lm") +
  theme_bw() #gives straight line because only reading temp as a single 
#variable instead of reading it in as the value in that column 

#creating own data set with only mg/L, Temp, filename, and other stuff that might be handy 
#dataSubSet <- c("Date", "Time", "Value", "o2_Unit", "Phase", "Temp", "Temp_Unit")

data1 <- subset(d, select = c(1, 2, 3, 7, 8, 16, 17, 56, 57))

#graphing by temperature 

ggplot(data1, aes(x = Temp, y = dateTime, colour = file)) +
  geom_point(size = 1) +
  #geom_smooth(method = "lm") +
  theme_bw()


########################################################################
#Trial B graphing 

library(ggplot2)

setwd("C:/Users/erin.tully/Desktop/Respirometry Trials/Trial_B_6.6.2019")

fileNames <- dir(getwd(),pattern=".csv")
#Create empty output file for new files to go into
b <- NULL

#Create loop to go through all files and remove unnecessary columns
for (i in 1:length(fileNames)){
  bTemp <- read.csv(fileNames[i], header=TRUE, skip = 1, stringsAsFactors = FALSE)
  bTemp$file <- fileNames[i]
  b <- rbind(b, bTemp)
}
#adding in Date Time value to orginial function 
b$dateTime <- paste(b$Date, b$Time, sep = " ")
b$dateTime <- as.POSIXct(b$dateTime, format="%m/%d/%Y %H:%M:%S")

#chaning temperature from number to factor 
b$Temp <- as.factor(b$Temp)

#First attempt. Going for time v O2 level with mg/L as unit 
ggplot(b, aes(x = dateTime, y = Value, colour = file)) +
  geom_point(size = 1) +
  geom_smooth(method = "lm") +
  theme_bw()



























