dir_name  <- "PCA_plots"
# Check if directory already exists
if (!file.exists(dir_name)) {
    dir.create(dir_name)
}

#load required packages
if(!require("reticulate")) {
  install.packages("reticulate")
  library(reticulate)
}	

if(!require("ggplot2")) {
  install.packages("ggplot2")
  library(ggplot2)
}	

if(!require("plyr")) {
  install.packages("plyr")
  library(plyr)
}	

if(!require("RColorBrewer")) {
  install.packages("RColorBrewer")
  library(RColorBrewer)
}	

os <- import("os")
os$listdir()
bcji <- import("bcjupyterimport")

#Load required data into R Studio 
#resFile1 and resFile4 are the only files that need to be changed
##resFile1 = eigenvectors from PCA
##resFile2 = 1000G superpopulation info
##resFile3 = 1000G samples in Phase 3
##resFile4 = Clin_Combined dataset

resFile1 = bcji$runSelectQuery("select * from ds102979")
print (resFile1)
eigenvec <- read.csv(resFile1, header = TRUE, sep = "\t")
print(eigenvec)

resFile2 = bcji$runSelectQuery("select * from ds101829")
print (resFile2)
phase3samples <- read.csv(resFile2, header = TRUE, sep = "\t")
print(phase3samples)

resFile3 = bcji$runSelectQuery("select * from ds101830")
print (resFile3)
omni_samples <- read.csv(resFile3, header = TRUE, sep = "\t")
print(omni_samples)

resFile4 = bcji$runSelectQuery("select * from ds102987")
print (resFile4)
Clin_Combined <- read.csv(resFile4, header = TRUE, sep = "\t")
print(Clin_Combined)

#First find and replace all instances of "MTX" with your project ID

# Subset for first 4 PCs
eigenvec <- subset(eigenvec, select = c(1:12))
colnames(eigenvec) <- c("sample","sample2","PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10")

# Upload super_population details for 1000GP
colnames(omni_samples) <- c("sample","pop","in_phase_3")

# Make data frame with unique super_populations and their superpops
colnames(phase3samples) <- c("sample","pop","super_pop","gender")
popDetail <- unique(phase3samples[,2:3])
popDetail <- popDetail[with(popDetail, order(popDetail$super_pop)), ]
samples <- merge(omni_samples, popDetail, by = "pop")

eigenvec$site <- as.factor(substr(eigenvec$sample, 1, 3))
eigenvec$site <- gsub("NA1", "1000G",eigenvec$site)
eigenvec$site <- gsub("NA2", "1000G",eigenvec$site)
eigenvec$site <- gsub("NA0", "1000G",eigenvec$site)
eigenvec$site <- gsub("HG0", "1000G",eigenvec$site)
eigenvec$site <- as.factor(eigenvec$site)
eigenvec$super_population <- with(eigenvec, ifelse(site=="1000G", "1000G", "MTX"))
eigenvec$super_population <- as.factor(eigenvec$super_population)

#Remove super population
project_only <- project_only[,1:13]
project_PCA <- project_only[,2:12]

# Select project samples
# project_only <- eigenvec[eigenvec$super_population=="MTX",]

Clin_Combined <- Clin_Combined[,c(1,2,2)]
colnames(Clin_Combined) <- c("sample","super_population", "population")
Clin_Combined

project_only_PCA 

# Get file with only samples to be included in combined cohort
project_only_PCA <- merge(project_only, Clin_Combined, by = "sample")

# Select 1000GP samples
PCA_1000G <- merge(eigenvec, samples, by = "sample")
PCA_1000G$super_population <- PCA_1000G$super_pop
PCA_1000G$population <- PCA_1000G$population
colnames(PCA_1000G)[14] <- "super_population"
colnames(PCA_1000G)[15] <- "population"


# Remove columns that are not in eigenvec
PCA_1000G <- PCA_1000G[,1:15]


# # Combine 1000GP and project
# # ggplot bug seems to plot the data that appears in data first - therefore add 1000G samples first

PCA_1000G$super_population <- as.factor(PCA_1000G$super_population)
project_only_PCA$super_population <- as.factor(project_only_PCA$super_population)

PCA_project_1000G <- rbind(PCA_1000G,project_only_PCA) 
PCA_project_1000G 

write.table(PCA_project_1000G, "PCA_MTX_1000G.txt", row.names=F, col.names=T, quote=F)

# # Add transparency column
PCA_project_1000G$alpha <- ifelse(PCA_project_1000G$site=="1000G",0.05, 0.4)

# # PCA plot colour information 
superpop.plot.colours <- c("#99CCFF", "#66FF66", "#FFFF99","#CC0000","#FF9966", "#FF0000", "#808000")

df_layer_1 <- PCA_project_1000G[PCA_project_1000G$super_population=="AFR",]
df_layer_2 <- PCA_project_1000G[PCA_project_1000G$super_population=="AMR",]
df_layer_3 <- PCA_project_1000G[PCA_project_1000G$super_population=="EAS",]
df_layer_4 <- PCA_project_1000G[PCA_project_1000G$super_population=="EUR",]
df_layer_5 <- PCA_project_1000G[PCA_project_1000G$super_population=="SAS",]
df_layer_6 <- PCA_project_1000G[PCA_project_1000G$super_population=="case",]
df_layer_6 <- PCA_project_1000G[PCA_project_1000G$super_population=="control",]


# Reorder super population levels so project levels are at the end
PCA_project_1000G$super_population <- factor(PCA_project_1000G$super_population, 
                                                  levels = c("AFR","AMR","EAS","EUR","SAS","case","control" ))

# Check that project level is at the end
factor(PCA_project_1000G$super_population)

# # Plot PC1vPC2
# ggplot() +
#   geom_point(data=df_layer_1, aes(x=PC1, y=PC2),
#              size=2.2, colour = "#99CCFF", alpha=0.3) +
#   theme_bw() + xlab("PC 1") + ylab("PC 2") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   geom_point(data=df_layer_2, aes(x=PC1, y=PC2),
#              size=2.2, colour = "#66FF66", alpha=0.3) +
#   theme_bw() + xlab("PC 1") + ylab("PC 2") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   geom_point(data=df_layer_3, aes(x=PC1, y=PC2),
#              size=2.2, colour = "#FFFF99", alpha=0.3) +
#   theme_bw() + xlab("PC 1") + ylab("PC 2") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   geom_point(data=df_layer_4, aes(x=PC1, y=PC2),
#              size=2.2, colour = "#CC0000", alpha=0.3) +
#   theme_bw() + xlab("PC 1") + ylab("PC 2") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   geom_point(data=df_layer_5, aes(x=PC1, y=PC2),
#              size=2.2, colour = "#FF9966", alpha=0.3) +
#   theme_bw() + xlab("PC 1") + ylab("PC 2") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   geom_point(data=df_layer_6, aes(x=PC1, y=PC2),
#              size=2.2, colour = "#000000", alpha=1) +
#   theme_bw() + xlab("PC 1") + ylab("PC 2") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   theme_bw() + xlab("PC 1") + ylab("PC 2") +
#   theme(legend.key=element_blank(), legend.title=element_blank())

PC1vsPC2 <- ggplot(data=PCA_project_1000G, aes(x=PC1, y=PC2)) +
  geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
  scale_alpha(guide = "none") +
  theme_bw() + xlab("PC 1") + ylab("PC 2") +
  theme(legend.key=element_blank(), legend.title=element_blank()) +
  scale_colour_manual(values=superpop.plot.colours)


# Plot PC2vPC3
PC2vsPC3 <- ggplot(data=PCA_project_1000G, aes(x=PC2, y=PC3)) +
  geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
  scale_alpha(guide = "none") +
  theme_bw() + xlab("PC 2") + ylab("PC 3") +
  theme(legend.key=element_blank(), legend.title=element_blank()) +
  scale_colour_manual(values=superpop.plot.colours)

# Plot PC3vPC4
PC3vsPC4 <- ggplot(data=PCA_project_1000G, aes(x=PC3, y=PC4)) +
  geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
  scale_alpha(guide = "none") +
  theme_bw() + xlab("PC 3") + ylab("PC 4") +
  theme(legend.key=element_blank(), legend.title=element_blank()) +
  scale_colour_manual(values=superpop.plot.colours)

# Plot PC4vPC5
PC4vsPC5 <-ggplot(data=PCA_project_1000G, aes(x=PC4, y=PC5)) +
  geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
  scale_alpha(guide = "none") +
  theme_bw() + xlab("PC 4") + ylab("PC 5") +
  theme(legend.key=element_blank(), legend.title=element_blank()) +
  scale_colour_manual(values=superpop.plot.colours)

# # Plot PC5vPC6
# PC5vsPC6 <- ggplot(data=PCA_project_1000G, aes(x=PC5, y=PC6)) +
#   geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
#   scale_alpha(guide = "none") +
#   theme_bw() + xlab("PC 5") + ylab("PC 6") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   scale_colour_manual(values=superpop.plot.colours)

# # Plot PC6vPC7
# PC6vsPC7 <- ggplot(data=PCA_project_1000G, aes(x=PC6, y=PC7)) +
#   geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
#   scale_alpha(guide = "none") +
#   theme_bw() + xlab("PC 6") + ylab("PC 7") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   scale_colour_manual(values=superpop.plot.colours)

# # Plot PC7vPC8
# ggplot(data=PCA_project_1000G, aes(x=PC7, y=PC8)) +
#   geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
#   scale_alpha(guide = "none") +
#   theme_bw() + xlab("PC 7") + ylab("PC 8") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   scale_colour_manual(values=superpop.plot.colours)

# # Plot PC8vPC9
# ggplot(data=PCA_project_1000G, aes(x=PC8, y=PC9)) +
#   geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
#   scale_alpha(guide = "none") +
#   theme_bw() + xlab("PC 8") + ylab("PC 9") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   scale_colour_manual(values=superpop.plot.colours)

# # Plot PC9vPC10
# ggplot(data=PCA_project_1000G, aes(x=PC9, y=PC10)) +
#   geom_point(size=2.2, aes(colour = super_population, alpha=alpha)) +
#   scale_alpha(guide = "none") +
#   theme_bw() + xlab("PC 9") + ylab("PC 10") +
#   theme(legend.key=element_blank(), legend.title=element_blank()) +
#   scale_colour_manual(values=superpop.plot.colours)

# # # save plots

ggsave("./PCA_plots/PC1vsPC2.png", PC1vsPC2)
ggsave( "./PCA_plots/PC2vsPC3.png", PC2vsPC3)
ggsave("./PCA_plots/PC3vsPC4.png", PC3vsPC4)


PCA_1000G




