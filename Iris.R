# Iris Flower Data Set
# Exploratory Data Analysis

# 1. Introduction

# The Iris flower data set consists of flower samples from three species of Iris plant (Iris setosa, Iris virginica and Iris versicolor), showing measures in centimeters of length and width of each type of flower's sepals and petals example.

# ![Image](1_7bnLKsChXq94QjtAiRn40w.png)

# This report presents an exploratory data analysis (EDA) of the Iris data set, which is a statistical approach to analyzing data sets whose the main purpose is to summarize their characteristics, usually in form of tables or visualizations.

# The report is organized into five parts, first, this introduction, second, loading libraries and data set, third, the EDA itself, divided into tables and visualizations, fourth, correlation analysis, and fifth, conclusion.

# This is a project made in and R with RStudio.

# 2. Load libraries and data set

# Library
library(tidyverse)
library(ggcorrplot)

# Data set
iris <- iris

# 3. Exploratory Data Analysis (EDA)

# 3.1 Tables

# 3.1.1 Print data set

# Data set
print(iris)

# 3.1.2 Get structure of the data set

# Structure of the data set
str(iris)

# 3.1.3 Check Species

# Species
levels(iris$Species) # and/or 
table(iris$Species)

# 3.1.4 Check missing values in the data set

# Missing values in the data set
iris %>% summarise(count = sum(is.na(iris)))

# 3.1.5 Perform statistical summary on the data set

# Summary of the data set
summary(iris)

# 3.1.6 Perform statistical summary by Species

# Summary of the data set by Species

# Setosa
summary(subset(iris, Species == "setosa"))

# Versicolor
summary(subset(iris, Species == "versicolor"))

# Virginica
summary(subset(iris, Species == "virginica"))

# 3.2 Visualizations

# 3.2.1 Histograms

# 3.2.1.1 Histograms with base R

# Histogram for Sepal Length
hist(iris$Sepal.Length)
# Histogram for Sepal Width
hist(iris$Sepal.Width)
# Histogram for Petal Length
hist(iris$Petal.Length)
# Histogram for Petal Width
hist(iris$Petal.Width)

# 3.2.1.2 Histograms with ggplot2

# Histogram for Sepal Length
ggplot(iris) +
  geom_histogram(aes(x=Sepal.Length))
# Histogram for Sepal Width
ggplot(iris) +
  geom_histogram(aes(x=Sepal.Width))
# Histogram for Petal Length
ggplot(iris) +
  geom_histogram(aes(x=Petal.Length))
# Histogram for Petal Width
ggplot(iris) +
  geom_histogram(aes(x=Petal.Width))

# 3.2.2 Bar plots

# Bar plot for Sepal Length
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "identity")

# Bar plot for Sepal Width
ggplot(iris, aes(Species, Sepal.Width)) +
  geom_bar(stat = "identity")

# Bar plot for Petal Length
ggplot(iris, aes(Species, Petal.Length)) +
  geom_bar(stat = "identity")

# Bar plot for Petal Width
ggplot(iris, aes(Species, Petal.Width)) +
  geom_bar(stat = "identity")

# 3.2.3 Box plots

# 3.2.3.1 Box plot with base R

boxplot(iris[,1:4])

# Box plot of variables by Species

setosa <- subset(iris, Species == "setosa")
versicolor <- subset(iris, Species == "versicolor")
virginica <- subset(iris, Species == "virginica")
par(mfrow=c(1,3),mar=c(6,3,2,1))
boxplot(setosa[,1:4], main="Setosa, Rainbow Palette", ylim = c(0,8),las=2, col=rainbow(4))
boxplot(versicolor[,1:4], main="Versicolor, Rainbow Palette", ylim = c(0,8),las=2, col=rainbow(4))
boxplot(virginica[,1:4], main="Virginica, Rainbow Palette",   ylim = c(0,8),las=2, col=rainbow(4))

# 3.2.3.2 Box plots with ggplot2

# Box plot for Sepal Length
ggplot(iris) +
  geom_boxplot(aes(x=Species, y=Sepal.Length, color=Species))
# Box plot for Sepal Width
ggplot(iris) +
  geom_boxplot(aes(x=Species, y=Sepal.Width, color=Species))
# Box plot for Petal Length
ggplot(iris) +
  geom_boxplot(aes(x=Species, y=Petal.Length, color=Species))
# Box plot for Petal Width
ggplot(iris) +
  geom_boxplot(aes(x=Species, y=Petal.Width, color=Species))

# 3.2.4 Violin plots

# Violin plot for Sepal Length
ggplot(iris) +
  geom_violin(aes(x=Species, y=Sepal.Length, color=Species))
# Violin plot for Sepal Width
ggplot(iris) +
  geom_violin(aes(x=Species, y=Sepal.Width, color=Species))
# Violin plot for Petal Length
ggplot(iris) +
  geom_violin(aes(x=Species, y=Petal.Length, color=Species))
# Violin plot for Petal Width
ggplot(iris) +
  geom_violin(aes(x=Species, y=Petal.Width, color=Species))

# 3.2.5 Density plots

# Density plot for Sepal Length
ggplot(iris) +
  geom_density(aes(x=Sepal.Length, color=Species))
# Density plot for Sepal Width
ggplot(iris) +
  geom_density(aes(x=Sepal.Width, color=Species))
# Density plot for Petal Length
ggplot(iris) +
  geom_density(aes(x=Petal.Length, color=Species))
# Density plot for Petal Width
ggplot(iris) +
  geom_density(aes(x=Petal.Width, color=Species))

# 3.2.6 Scatter plots

# Scatter plot of Sepal Length vs. Sepal Width
ggplot(iris) +
  geom_point(aes(x=Sepal.Length, y=Sepal.Width, color=Species))

# Scatter plot of Sepal Length vs. Petal Length
ggplot(iris) +
  geom_point(aes(x=Sepal.Length, y=Petal.Length, color=Species))

# Scatter plot of Sepal Length vs. Petal Width
ggplot(iris) +
  geom_point(aes(x=Sepal.Length, y=Petal.Width, color=Species))


# Scatter plot of Sepal Width vs. Sepal Length
ggplot(iris) +
  geom_point(aes(x=Sepal.Width, y=Sepal.Length, color=Species))

# Scatter plot of Sepal Width vs. Petal Length
ggplot(iris) +
  geom_point(aes(x=Sepal.Width, y=Petal.Length, color=Species))

# Scatter plot of Sepal Width vs. Petal Width
ggplot(iris) +
  geom_point(aes(x=Sepal.Width, y=Petal.Width, color=Species))


# Scatter plot of Petal Length vs. Sepal Length
ggplot(iris) +
  geom_point(aes(x=Petal.Length, y=Sepal.Length, color=Species))

# Scatter plot of Petal Length vs. Sepal Width
ggplot(iris) +
  geom_point(aes(x=Petal.Length, y=Sepal.Width, color=Species))

# Scatter plot of Petal Length vs. Petal Width
ggplot(iris) +
  geom_point(aes(x=Petal.Length, y=Petal.Width, color=Species))


# Scatter plot of Petal Width vs. Sepal Length
ggplot(iris) +
  geom_point(aes(x=Petal.Width, y=Sepal.Length, color=Species))

# Scatter plot of Petal Width vs. Sepal Width
ggplot(iris) +
  geom_point(aes(x=Petal.Width, y=Sepal.Width, color=Species))

# Scatter plot of Petal Width vs. Petal Length
ggplot(iris) +
  geom_point(aes(x=Petal.Width, y=Petal.Length, color=Species))

# 3.2.7 Pair plot

# Pair plot
pairs(iris[,1:4])

# 4. Correlation

# 4.1 Correlation matrix

# Pearson, Kendall and Spearman correlation
cor(iris[,1:4], method = c("pearson", "kendall", "spearman"))

# Round iris to two decimals
round(iris[,1:4], 2)

# Correlation matrix variable
iriscorr <- cor(iris[,1:4])

# 4.2 Correlation plot

# Correlation plot
ggcorrplot(iriscorr, lab = TRUE)

# 5. Conclusion

# In consideration of the Iris flower data set, this EDA uses tables to have a glimpse of the data table, information of variables (features and target) and statistical summaries of the data, and the visualizations histogram, box plot, violin plot, kernel density estimator, scatter plot and heat map to acknowledge the relationship between variables.

# When possible, tables or visualizations are implemented in more than one package in order to compare and/or contrast, among other attributes, their functionality and performance, and, in this way, to prove which one offers a better user experience according to the user's interests.

# As it was said in the introduction, usually EDA is developed by means of tables and visualizations. Choosing between one or another means of data representation depends on criteria like the kind of information that is useful to observe. If it's useful to look up particular information, like individual values or detailed summaries, tables are indicated, on the contrary, when it's useful to look up general information, like patterns, trends, exceptions, visualizations are the indicated. This EDA's guiding principle is precise to arrange the data set's main information by means of tables and its variables' behavior by means of visualizations.

# Besides any criterion to choose between data representation means in an EDA, it seems that for correlations analysis both tables and visualizations are suitable. The former gives the exact values at which variables interact, while the latter gives the perspective of the whole variables' interaction. On purpose of correlation analysis, it'd better say that it may be or not part of an EDA.

# This project about an EDA on the Iris flower data set is based in a judgement on the minimal tables and visualizations that this data set should have, however, the quantity of other data representation possible.
