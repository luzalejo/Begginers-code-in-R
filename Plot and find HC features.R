#find and plot highly correlated features in a dataset
library(caret)
#cor_mat is a correlation matrix created with cor()
#findCorrelation from caret library 

HC_cor<-findCorrelation(cor_mat,cutoff=0.7,verbose = T)
#this allows to directly select the subset of HC_cor in your data frame=data_frame
HC_subset<-as.data.frame(subset(data_frame,select=c(sort(print(HC_cor)))))
#this would be the correlation matrix of the HC features
cor_HC<-cor(HC_subset,use = "pairwise.complete.obs")

#Ta da! plot HC features
corrplot(cor_HC,method = "color",type = "lower",diag = F,tl.cex = 0.5,order = "hclust",
         tl.col = "black",tl.srt = 15,addgrid.col = T,col= colorRampPalette(c("white","grey", "black"))(10))
