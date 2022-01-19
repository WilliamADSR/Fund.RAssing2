library(ggplot2)
library(GGally)
library(readr)
library(dbplyr)
library(tidyverse)
library(magrittr)
library(lattice)
library(correlation)
library(ggcorrplot)
library(see)
library(caret)
library(psych)

heart <- read_csv("heart.csv", 
                  col_types = cols(Age = col_number(),
                                   Sex = col_factor(),
                                   ChestPainType = col_factor(),
                                   RestingBP = col_number(),
                                   Cholesterol = col_number(), 
                                   FastingBS = col_factor(), 
                                   RestingECG = col_factor(),
                                   MaxHR = col_number(),
                                   ExerciseAngina = col_factor(),
                                   Oldpeak = col_number(),
                                   ST_Slope = col_factor(), 
                                   HeartDisease = col_factor()
                  )
)

heart$FastingBS <- factor(heart$FastingBS,
                          labels = c("B120", "A120"))
heart$HeartDisease <- factor(heart$HeartDisease,
                             labels = c("Norm", "Prob"))

Clean_Heart <- heart[-c(294:416, 422, 
                        424:425, 428:431, 
                        435:443, 536:537, 
                        519, 515:516, 509, 
                        493, 484:485, 480:482,
                        478, 475:476, 471:473,
                        467:468, 464:465,
                        462, 456:460, 450:452,
                        454, 447), ]

set.seed(42)
trainDataIndex <- createDataPartition(Clean_Heart$HeartDisease, p=0.8, list = FALSE)  
train_heart <- Clean_Heart[trainDataIndex, ]
test_heart <- Clean_Heart[-trainDataIndex, ]

barplot(table(train_heart$HeartDisease, train_heart$Sex), col = c("green","red"))
legend("topright", c("Normal","Problem"), fill = c("green","red"))

tsex <- table(train_heart$HeartDisease, train_heart$Sex)
tsex
tsexp <- scale(tsex, FALSE, colSums(tsex)) * 100
tsexp

bp <- barplot(tsexp, beside = TRUE, col = c("green","red"), ylim=c(0,100))
legend("topright", c("Normal","Problem"), fill = c("green","red"))
text(bp, 0, round(tsexp, 0), cex = 1, pos = 3)
