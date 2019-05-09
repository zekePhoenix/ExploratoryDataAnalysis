## Script 4 of 6
##This script is four out of six scripts for this assignment. 

#Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal


nei_scc <- merge(nei, scc, by = "SCC")#Merge nei and scc datasets

coal <- grepl("coal", nei_scc$Short.Name, ignore.case = TRUE)

subset_nei_scc <- nei_scc[coal, ]

totalbyYear <- aggregate(Emissions ~ year, subset_nei_scc, sum) #Table for emission totals by year

#Write plot to PNG file in working directory
png("plot4.png", width=640, height=480)
g <- ggplot(totalbyYear, aes(factor(year), Emissions)) +
    geom_bar(stat = "identity", fill = "red") + theme_bw() +
    coord_flip() + #coord_flip to make chart horizontal
    labs(title = "Question 4 Chart: coal combustion-related sources - 1999–2008") + 
    theme_gray()
g
dev.off()
