library(ggplot2)
#install.packages("tidyr")
library(tidyr)


setwd("C:/Users/erin.tully/Desktop/Respirometry Trials/Trial_N_6.27.2019")

#List all files in that directory
file.names <- dir(getwd(),pattern=".csv")
#Create empty output file for new files to go into
#n <- NULL
file1 <- NULL

#Create loop to go through all files and remove unnecessary columns

for (i in 1:length(file.names))
  file2 <- read.csv(file.names[i], header=TRUE, skip = 1, stringsAsFactors = FALSE)
  file2$file <- file.names[i]
  file1 <- rbind(file1, file2)


#make variables out of the columns you want to keep
Value <- file1$Value
O2_Unit <- file1$O2_Unit
delta_t <- file1$delta_t
Time_Unit <- file1$Time_Unit

#insert those columns into a shiny new data frame - make new columns for data you need to manipulate
df <- data.frame(Value, O2_Unit, delta_t, Time_Unit)
df$Weight_g <- ""
df$file <- data.frame(file1$file)
df$O2_Consumption_Rate<- ""

#reading in the file containing the weight measurments 
Crab_weights <- read.csv("C:/Users/erin.tully/Desktop/Respirometry Trials/Crab_weights.csv")

#trying to view read in csv 
#wondering if it will be able to merge the weights for the proper crabs cause they are named 
#diferently in the 02 dataframe 
View(Crab_weights)
merged <- merge(df, Crab_weights) #this did not work and there is no data in the data frame 
View(merged)





















