## Script 2 of 6
##This script is second out of six scripts for this assignment. 

#Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subset_nei <- nei[nei$fips == "24510",]
totalbyYear <- aggregate(Emissions ~ year, subset_nei, sum) #Table for emission totals by year

#Write barplot to PNG file in working directory
png("plot2.png")
barplot(height = totalbyYear$Emissions, names.arg = totalbyYear$year, xlab = "years", ylab = expression('total PM'[2.5]*' emission'), main = "Question 2 Chart")
dev.off()