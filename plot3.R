## Script 3 of 6
##This script is third out of six scripts for this assignment. 

#Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

subet_nei <- nei[nei$fips=="24510",] #subset of nei data for  Baltimore City
 
totalbyYearType <- aggregate(Emissions ~ year + type, subset_nei, sum) #Table for emission totals by year and by type

#Write plot to PNG file in working directory
png("plot3.png", width=640, height=480)
g <- ggplot(totalbyYearType, aes(year, Emissions, color = type)) #Configure plot
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('total PM'[2.5]*' emission')) + 
    ggtitle("Question 3 Chart")
g 
dev.off()