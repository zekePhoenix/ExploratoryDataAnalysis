## Script 1 of 6
##Prepare Data for questions in project
##This script is first out of six scripts for this assignment. 
library("data.table")
library(ggplot2)
datafileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(url = datafileURL, destfile = "./dataFiles.zip")
unzip(zipfile = "datafiles.Zip")

scc <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
nei <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

#Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

totalbyYear <- aggregate(Emissions ~ year, nei, sum) #Table for emission totals by year
#Write barplot to PNG file in working directory
png("plot1.png")
barplot(height = totalbyYear$Emissions, names.arg = totalbyYear$year, xlab = "years", ylab = expression('total PM'[2.5]*' emission'), main = "Question 1 Chart")
dev.off()