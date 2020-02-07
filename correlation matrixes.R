#Basic correlation matrixes in R 

library(corrplot)
library(caret)
#data is a dataframe which can or cannot contain missing values, therefore we use "pairwise.complete.obs"

cor_mat<-cor(Data,use = "pairwise.complete.obs")

#Here you create a lower correlation matrix without a diagonal and modifiying the size 
#of the leter with tl.cex, the order means that the highly correlated features will be clustered
#tl.col is the color of the text and the tl.srt is the angle of the text 

corrplot(cormat,method="color",type="lower",diag=F,tl.cex=0.7,order = "hclust",
         tl.col = "black",tl.srt=15,addgrid.col=T)

#some variants to the correlation matrix color, instead if you would like to use only grey pallette

corrplot(cor_mat,method="color",type="lower",diag=F,tl.cex=0.4,order = "hclust",
         tl.col = "black",tl.srt=15,addgrid.col=T,col= colorRampPalette(c("white","grey", "black"))(10))
