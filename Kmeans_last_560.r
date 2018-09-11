---
title: "Last Exercise"
output:
  html_document:
    df_print: paged
---
```{r}
cereals <- read.csv()
```

```{r}
length(which(is.na(cereals)))
```

```{r}
cereals <- cereals[complete.cases(cereals),]
```
```{r}
names(cereals)
```
```{r}
set.seed(2222)
cereals_k <- cereals[, -c(1:3,16)]
```
```{r}
cereals_k[,c(3:14)] <- scale(cereals_k[,c(3:14)])
dist_cereals_k <- dist(cereals_k)
km1 <- kmeans(cereals_k,5)
km1
library(factoextra)
#get_dist(cereals_k)
fviz_cluster(km1, data = cereals_k)
```
```{r}
library(cluster)
library(ggplot2)
library(factoextra)
dist_cereals_model1<-fviz_silhouette(silhouette(km1$cluster, dist_cereals_k))
dist_cereals_model1
```


```{r}
km2 <- kmeans(cereals_k,3)
km2
library(factoextra)
#get_dist(cereals_k)
fviz_cluster(km2, data = cereals_k)
```
```{r}
dist_cereals_model2 <-fviz_silhouette(silhouette(km2$cluster, dist_cereals_k))
dist_cereals_model2
```
