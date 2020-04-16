library(dbscan)
library(ggplot2)
library(factoextra)
library(GGally)
#dataset=dataframe numerical variables
dist_dataset<-kNNdistplot(scale(dataset), k =  5)
abline(h = 15,lty=2) #h would be the eps value
# k is the minimum nearest neighbors to consider
db_dat <- dbscan(scale(dataset), eps = 15)
#here we expand the dataset that would save the cluster assignment as a column
db_dat_clus<-cbind(dataset,db_dat$cluster)
#in the following line we define the cluster column as a categorical class
db_dat_clus$`db_dat$cluster`<-as.factor(db_dat_clus$`db_dat$cluster`)
#here we rename the column
names(db_dat_clus)[5]<-"Cluster" #5 or any other number in the expanded dataset corresponding to the cluster column
#plot the clustering results 
p_dbscan<-fviz_cluster(db_dat, scale(dataset), 
                  geom='point',
                  ellipse.type = "norm",
                  palette = "jco",
                  ellipse.level = 0.9,
                  ggtheme = theme_classic(),main=" ")
#visualize the plot:
p_dbscan

#other opportunity to plot clustering results:

DBSCAN_S1plot<-ggpairs(db_dat_clus,columns =23:30,aes(colour=Cluster))+theme_classic(base_size = 8)
DBSCAN_S1plot
#---
#to change the colors of the clusters

DBSCAN_S1multiplot1<-ggpairs(db_dat_clus, mapping = aes(colour = Cluster), columns = c(7,14:18,21,22),
                          upper = list(continuous = function(data, mapping, ...) {
                            ggally_cor(data = data, mapping = mapping, size = 3) + scale_colour_manual(values = c("black","#0073C2FF", "#EFC000FF", "red"))}),
                          lower = list(continuous = function(data, mapping, ...) {
                            ggally_smooth(data = data, mapping = mapping, alpha = .8) + scale_colour_manual(values = c("black","#0073C2FF", "#EFC000FF", "red"))}),
                          diag = list(continuous = function(data, mapping, ...) {
                            ggally_densityDiag(data = data, mapping = mapping, alpha = .9) + scale_fill_manual(values = c("black","#0073C2FF", "#EFC000FF", "red"))}))+theme_classic(base_size = 6)
DBSCAN_S1multiplot1
