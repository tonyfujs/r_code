### Load libraries & custom functions----
library(ggplot2)
library(gridExtra)
library(plyr)
library(scales)
library(stringr)
source('ggBulletGraph.r')

### Create a dataset----
ytd2005 <- data.frame(
  measure=c("Revenue", "Profit", "Avg Order Size", "New Customers", "Cust Satisfaction"),
  units=c("U.S. $ (1,000s)", "%", "U.S. $", "Count", "Top Rating of 5"),
  low=c(150, 20, 350, 1400, 3.5), 
  mean=c(225, 25, 500, 2000, 4.25),
  high=c(300, 30, 600, 2500, 5),
  target=c(250, 26, 550, 2100, 4.2),
  value=c(275, 22.5, 310, 1700, 4.5)
)

### Plot horizontal chart----
# Creates a horizontal bullet chart for each measure in the ytd2005 dataset
h_plot <- dlply(ytd2005, .(measure), function(df) h_bullet(df))
# Ensures that each plot has the same width so they align correctly
gp <- llply(h_plot, function(l) ggplot_gtable(ggplot_build(l)))
maxWidth <- unit.pmax(gp[[1]]$widths[2:3], gp[[2]]$widths[2:3], 
                      gp[[3]]$widths[2:3], gp[[4]]$widths[2:3], gp[[5]]$widths[2:3])
for (i in 1:length(gp)) { gp[[i]]$widths[2:3] <- maxWidth }

# Save all plots as a unique .png image
png("../charts/h_bullet_chart.png", width=1200, height=600)
do.call("grid.arrange", c(gp, ncol = 1))
dev.off()

### Plot vertical chart----
# Creates a vertical bullet chart for each measure in the ytd2005 dataset
v_plot <- dlply(ytd2005, .(measure), function(df) v_bullet(df))
# Ensures that each plot has the same width so they align correctly
gp <- llply(v_plot, function(l) ggplot_gtable(ggplot_build(l)))
maxWidth <- unit.pmax(gp[[1]]$widths[2:3], gp[[2]]$widths[2:3], gp[[3]]$widths[2:3], gp[[4]]$widths[2:3], gp[[5]]$widths[2:3])
for (i in 1:length(gp)) { gp[[i]]$widths[2:3] <- maxWidth }

# Save all plots as a unique .png image
png("../charts/v_bullet_chart.png", width=1200, height=600)
do.call("grid.arrange", c(gp, nrow = 1))
dev.off()


