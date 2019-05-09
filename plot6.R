## Script 6 of 6
##This script is six out of six scripts for this assignment. 

#Question 6
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

#Find nei data for vehilces
vehicle_condition <- grepl("vehicle", scc[, SCC.Level.Two], ignore.case = TRUE)
vehilce_scc <- scc[vehicle_condition, SCC]
vehicle_nei <- nei[nei[, SCC] %in% vehilce_scc,]

#subset for Baltimore City and add city name
subset_vehicle_nei_Balt <- vehicle_nei[fips == "24510",]
subset_vehicle_nei_Balt[, city := c("Baltimore City")]

#subset for Los Angeles and add city name
subset_vehicle_nei_LA <- vehicle_nei[fips == "06037",]
subset_vehicle_nei_LA[, city := c("Los Angeles")]

#Combine both subsets into one data table
twoCitynei <- rbind(subset_vehicle_nei_LA, subset_vehicle_nei_Balt)

#Write plot to PNG file in working directory
png("plot6.png")

g <- ggplot(twoCitynei, aes(x = factor(year), y = Emissions, fill = city)) +
    geom_bar(aes(fill=year), stat = "identity") +
    facet_grid(scales = "free", space = "free", .~city)+
    labs(title = "Question 6 Chart: Emissions from vehilces - Baltimore & LA - 1999–2008") + 
    theme_gray()
g
dev.off()
