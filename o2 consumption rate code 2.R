library(ggplot2)
#install.packages("tidyr")
library(tidyr)
library(stringr)


setwd("C:/Users/erin.tully/Desktop/Respirometry Trials/files")

#List all files in that directory
file.names <- dir(getwd(),pattern=".csv")
#Create empty output file for new files to go into
#n <- NULL
file1 <- NULL

#Create loop to go through all files and remove unnecessary columns

for(i in 1:length(file.names)){
  file2 <- read.csv(file.names[i], header=TRUE, skip = 1, stringsAsFactors = FALSE)
  file2 <- subset(file2, select = c("Value", "O2_Unit", "delta_t", "Time_Unit"))
  file2$file <- file.names[i]
  file1 <- rbind(file1, file2)
}

d <- file1

#reading in the file containing the weight measurments 
Crab_weights <- read.csv("C:/Users/erin.tully/Desktop/Respirometry Trials/Crab_weights.csv")

d$Crab <- paste(word(d$file, 5, 5, sep = "_"), word(d$file, 6, 6, sep = "_"), sep = "_")
d$TrialName <- paste(word(d$file, 2, 2, sep = "_"), word(d$file, 3, 3, sep = "_"), sep = "_")
d$Crab_Trial <- paste(d$Crab, d$TrialName, sep = "_")

dm <- merge(d, Crab_weights, by= "Crab", all.x = TRUE)
dm$delta_t <- as.numeric(dm$delta_t)
#View(subset(dm, is.na(delta_t)))
#playing around with this line of code 
dm <- subset(dm, delta_t > 35 & delta_t < 155)


crabMeanO2 <- tapply(dm$Value, dm$Crab_Trial, FUN = mean)
dmean <- as.data.frame(crabMeanO2)


levels(as.factor(dm$TrialName))


#must try to make one that is only blanks/ only crabs 

dm$BlankName <- paste(word(dm$file, 4, 4, sep = "_"), word(dm$file, 2, 2, sep = "_"), sep = "_")

levels(as.factor(dm$BlankName))


dm_blank$BlankName <- paste(word(dm_blank$file, 4, 4, sep = "_"), word(dm_blank$file, 2, 2, sep = "_"), sep = "_")

levels(as.factor(dm_blank$BlankName))

dm$rate <- dm$Value / dm$delta_t  / dm$Weight_g

#this gives minute by minute rate of o2 consumption. 
#next step to get a mean value for o2 blank consumption to be able to substract that part out from 
#the crab consumption rate 

write.csv(dm, "C:/Users/erin.tully/Desktop/Respirometry Trials/dm_all_files.csv")





#trying to get equation 
#know that i need a crab and a blank chart 
#is there an easier way than going through all the code twice 
      #seperating out crabs and blanks on the working directory level 
#









#repeat of the code for blank only measurements 

#---------------

#working with the code to get a blank csv file and a crab csv file and then merging by trial?
#still unsure about best way to combine them 


library(ggplot2)
#install.packages("tidyr")
library(tidyr)
library(stringr)


setwd("C:/Users/erin.tully/Desktop/Respirometry Trials/files/Blanks")

#List all files in that directory
file.names_blank <- dir(getwd(),pattern=".csv")
#Create empty output file for new files to go into
#n <- NULL
file1_blank <- NULL

#Create loop to go through all files and remove unnecessary columns

for(i in 1:length(file.names_blank )){
  file2_blank <- read.csv(file.names_blank[i], header=TRUE, skip = 1, stringsAsFactors = FALSE)
  file2_blank  <- subset(file2_blank, select = c("Value", "O2_Unit", "delta_t", "Time_Unit"))
  file2_blank$file_blank  <- file.names_blank[i]
  file1_blank  <- rbind(file1_blank , file2_blank )
}

d_blank  <- file1_blank 

#reading in the file containing the weight measurments 
Crab_weights <- read.csv("C:/Users/erin.tully/Desktop/Respirometry Trials/Crab_weights.csv")

d_blank$Crab <- paste(word(d_blank$file, 5, 5, sep = "_"), word(d_blank$file, 6, 6, sep = "_"), sep = "_")
d_blank$TrialName <- paste(word(d_blank$file, 2, 2, sep = "_"), word(d_blank$file, 3, 3, sep = "_"), sep = "_")
d_blank$Crab_Trial <- paste(d_blank$Crab, d_blank$TrialName, sep = "_")

dm_blank <- merge(d_blank, Crab_weights, by= "Crab", all.x = TRUE)
dm_blank$delta_t <- as.numeric(dm_blank$delta_t)
#View(subset(dm, is.na(delta_t)))
#playing around with this line of code 
dm_blank <- subset(dm_blank, delta_t > 35 & delta_t < 155)


crabMeanO2_blank <- tapply(dm_blank$Value, dm_blank$Crab_Trial, FUN = mean)
dmean_blank <- as.data.frame(crabMeanO2_blank)


levels(as.factor(dm_blank$TrialName))


#must try to make one that is only blanks/ only crabs 

dm_blank$BlankName <- paste(word(dm_blank$file, 4, 4, sep = "_"), word(dm_blank$file, 2, 2, sep = "_"), sep = "_")

levels(as.factor(dm_blank$BlankName))

dm_blank$rate <-dm_blank$Value / dm_blank$delta_t #this gives minute by minute rate of o2 consumption. 
#next step to get a mean value for o2 blank consumption to be able to substract that part out from 
#the crab consumption rate 

crabMeanO2_blank_rate <- tapply(dm_blank$rate, dm_blank$Crab_Trial, FUN = mean)
dmean_blank_rate <- as.data.frame(crabMeanO2_blank_rate)
write.csv (dmean_blank_rate, "C:/Users/erin.tully/Desktop/Respirometry Trials/files/Blanks/blank_rate.csv")
















