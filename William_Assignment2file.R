#1. Required Packages (everyone can add whatever they need)
library(readr)
library(dbplyr)
library(tidyverse)
library(ggplot2)
library(magrittr)
library(lattice)

#2. Loading the 'Heart Failure Prediction' data set
{
heart <- read_csv("heart.csv", 
                  col_types = cols(Age = col_number(), 
                  RestingBP = col_number(), Cholesterol = col_number(), 
                  FastingBS = col_double(), RestingECG = col_character(), 
                  MaxHR = col_number(), ExerciseAngina = col_character(),
                  Oldpeak = col_number(), ST_Slope = col_character(),
                  HeartDisease = col_double()))

}

#3. Inspection of the data set
View(heart) 
summary(heart)
str(heart)
head(heart)

#4. Explanation of the variables

#This data set holds 12 variables of which HeartDisease is our dichotomous outcome variable. A futher elaboration on the variables follows:
#Variable 1: Age. It's a numeric variable of the patients' age expressed in years.
#Variable 2: Sex. It's a categorical variable which holds the groups: F = female & M = male
#Variable 3: ChestPaintype. It's a categorical variable which contains 4 different types of chest pains.
          #TA: Typical Angina, a type of chest pain caused by reduced blood flow to the heart
          #ATA: Atypical Angina, a type of chest pain that doesn’t meet the criteria for angina
          #NAP: Non-Anginal Pain, a type of chest pain that is not caused by heart disease or a heart attack
          #ASY: Asymptomatic, a type of chest pain that includes no chest pain but there is angina
#Variable 4: RestingBP. It's a numeric variable representing patients' resting blood pressure (mmHg). The average blood pressure for an adult male is 120/80 mmHg. Average blood pressure increases when people get older. Furthermore, women's average blood pressure is mostly a little bit lower compared to males. A resting blood pressure > 140 is considered high and may cause heart failure.
#Variable 5: Cholesterol. It's a numeric variable representing patients' cholesterol levels (mm / dl). A healthy adult has a cholesterol level lower than 200 mm / dl. High cholesterol levels (> 240) is moderate/high and therefore may cause heart failure.
#Variable 6: FastingBS. It's a dichotomous variable representing patients' fasting blood sugar (mg / dl). Fasting blood sugar levels > 120 mg / dl are coded as a 1. Fasting blood sugar levels < 120 mg / dl are coded as a 0. High levels of blood sugar infer diabetes which may cause heart failure. 
#Variable 7: RestingECG. It's a categorical variable which contains 3 different types of electric activity in the heart.
          #Normal: The heart is beating in a regular sinus rhythm at a normal pace. No danger whatsoever 
          #ST: Indicates an abnormality in the heartbeat. It is associated with increased cardiovascular risk.
          #LVH: This activity in the heart represents valve problems which increasingly thickens the wall of the heart's main pumping chamber. It's the most common cause of high blood pressure which may cause heart failure.
#Variable 8: MaxHR.
#Variable 9: Exercise Angina.
#Variable 10: Oldpeak
#Variable 11: ST_slope
#Variable 12: HeartDisease.

#5. Excluding the NA's of cholesterol
{
Clean_Heart <- heart[-c(294:416, 422, 
                        424:425, 428:431, 
                        435:443, 536:537, 
                        519, 515:516, 509, 
                        493, 484:485, 480:482,
                        478, 475:476, 471:473,
                        467:468, 464:465,
                        462, 456:460, 450:452,
                        454, 447), ]
}

#6. Descriptives (histograms + boxplots + ...)

Hist_age <- hist(Clean_Heart$Age)
Box_age <- boxplot(Clean_Heart$Age) + title(main = "Distribution of age", ylab = "Age in years")
median(Clean_Heart$Age)
#Age is distributed normally. The youngest observations is 28 years old and the oldest observation is 77 years old. The median of this data set is 54.

Hist1_chol <- hist(heart$Cholesterol)
#The Cholesterol variable has 172 observations of the number 0. This means there are 172 patients without data on cholesterol levels. Therefore these observations will be exluded from the dataset since a value of 0 on cholesterol levels is impossible. 
Hist2_chol <- hist(Clean_Heart$Cholesterol)
Box_chol <- boxplot(Clean_Heart$Cholesterol) + title(main = "Distribution of cholesterol levels", ylab = "Cholesterol levels (mm / dl)")
min(Clean_Heart$Cholesterol)
max(Clean_Heart$Cholesterol)
median(Clean_Heart$Cholesterol)
#Here we see that the distribution of cholesterol levels has several outliers. The median is a cholesterol level of 237 which is within the range of a healthy level. a The lowest level of cholesterol is 85 and the highest level of cholesterol is 603. When checking assumptions we will see whether we need to exclude more observations due to abnormal cholesterol levels.

Hist_BPrest <- hist(Clean_Heart$RestingBP)
Box_BPrest <- boxplot(Clean_Heart$RestingBP) + title(main = "Distribution of resting blood pressure levels", ylab = "Resting blood pressure levels (mmHg)")
median(Clean_Heart$RestingBP)
max(Clean_Heart$RestingBP)
#Most of the observations have a healthy resting blood pressure, which the median of 130 also represents. There are some outliers past the maximum of the boxplot, the highest observations has a resting blood pressure of 200 which is very dangerous.

#7. Correlation Matrix

#8. Building a mode
Model1 <- glm(HeartDisease ~ Cholesterol, data = Clean_heart, family = "binomial")
summary(Model1)



