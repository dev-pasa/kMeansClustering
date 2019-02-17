---
title: "Cereal Data Analysis"
output:
  html_document:
    df_print: paged
---
```{r}
#read the dataset
cereals <- read.csv()
```

```{r}
#check for NAs in the dataset
length(which(is.na(cereals)))
```

```{r}
#remove null data from the dataset
cereals <- cereals[complete.cases(cereals),]
```

```{r}
# check the names of the data set
names(cereals)
```

```{r}
set.seed(2222)
#pick which columns to analyze
cereals_k <- cereals[, -c(1:3,16)]
```

```{r}
cereals_k[,c(3:14)] <- scale(cereals_k[,c(3:14)])
dist_cereals_k <- dist(cereals_k)

#run kmeans clustering algorithm and request 5 centers. 
km1 <- kmeans(cereals_k,5)
km1
library(factoextra)
#get_dist(cereals_k)
fviz_cluster(km1, data = cereals_k)
```

```{r}
#use libraries for data visualization
library(cluster)
library(ggplot2)
library(factoextra)
dist_cereals_model1<-fviz_silhouette(silhouette(km1$cluster, dist_cereals_k))
dist_cereals_model1
```

```{r}
#run kmeans clustering algorithm and request 3 centers. 
km2 <- kmeans(cereals_k,3)
km2
library(factoextra)
#get_dist(cereals_k)
fviz_cluster(km2, data = cereals_k)
```

```{r}
#produce a silhouette plot for more analysis
dist_cereals_model2 <-fviz_silhouette(silhouette(km2$cluster, dist_cereals_k))
dist_cereals_model2
```

