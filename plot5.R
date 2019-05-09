## Script 5 of 6
##This script is five out of six scripts for this assignment. 

#Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Find nei data for vehilces
vehicle_condition <- grepl("vehicle", scc[, SCC.Level.Two], ignore.case = TRUE)
vehilce_scc <- scc[vehicle_condition, SCC]
vehicle_nei <- nei[nei[, SCC] %in% vehilce_scc,]

#subset for Baltimore City
subset_vehicle_nei <- vehicle_nei[fips == "24510",]

#Write plot to PNG file in working directory
png("plot5.png", width=640, height=480)
g <- ggplot(subset_vehicle_nei, aes(factor(year), Emissions)) +
    geom_bar(stat = "identity", fill = "red") + theme_bw() +
    coord_flip() + #coord_flip to make chart horizontal
    labs(title = "Question 5 Chart: Emissions from vehilces - Baltimore - 1999–2008") + 
    theme_gray()
g
dev.off()
