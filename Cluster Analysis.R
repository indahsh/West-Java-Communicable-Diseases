#Library
library(readxl)
library(dbscan)
library(factoextra)

#Input Data
input_data = read_excel("D:/04. KERJA/Portofolio/Communicable diseases in West Java (2021)/Communicable Diseases West Java Dataset.xlsx",
                        sheet = "Data")
data = as.data.frame(input_data[,-1])
head(data)

#Descriptive Statistics
calculation <- function(data) {
  results = matrix(NA, nrow = 3, ncol = 4)
  colnames(results) <- colnames(data)
  rownames(results) <- c("Rata-rata", "Nilai Minimum", "Nilai Maksimum")
  
  for (i in 1:ncol(data)) {
    results[1, i] <- round(mean(data[[i]]), 0)
    results[2, i] <- round(min(data[[i]]), 0)
    results[3, i] <- round(max(data[[i]]), 0)
  }
  
  return(results)
}

descriptive_statistics <- calculation(data)
print(descriptive_statistics)

#Tuberculosis
#Sort data from highest to lowest
X1_sorted <- input_data[order(input_data$X1, decreasing = TRUE), ]
#Create a bar chart
par(mar = c(11, 4, 1, 0) + 0.1)
bar_chart.X1 <- barplot(X1_sorted$X1, names.arg = X1_sorted$`Regencies/Cities`,
                        las = 2, ylim = c(0, 15000))
#Show the number of cases of each object
text(x = bar_chart.X1 + 0.2, y = X1_sorted$X1 + 500, labels = X1_sorted$X1, 
     cex = 0.9, pos = 3, srt = 90)
#Show the average value
abline(h = mean(X1_sorted$X1), col = "red", lty = 2)
text(x = max(bar_chart.X1) - 1.3, y = mean(X1_sorted$X1), 
     labels = paste(round(mean(X1_sorted$X1), 0)), pos = 3, cex = 0.9)

#HIV
#Sort data from highest to lowest
X2_sorted <- input_data[order(input_data$X2, decreasing = TRUE), ]
#Create a bar chart
par(mar = c(11, 4, 1, 0) + 0.1)
bar_chart.X2 <- barplot(X2_sorted$X2, names.arg = X2_sorted$`Regencies/Cities`,
                        las = 2, ylim = c(0, 500))
#Show the number of cases of each object
text(x = bar_chart.X2 + 0.2, y = X2_sorted$X2 + 10, labels = X2_sorted$X2, 
     cex = 0.9, pos = 3, srt = 90)
#Show the average value
abline(h = mean(X2_sorted$X2), col = "red", lty = 2)
text(x = max(bar_chart.X2) - 1.3, y = mean(X2_sorted$X2), 
     labels = paste(round(mean(X2_sorted$X2), 0)), pos = 3, cex = 0.9)

#Leprosy
#Sort data from highest to lowest
X3_sorted <- input_data[order(input_data$X3, decreasing = TRUE), ]
#Create a bar chart
par(mar = c(11, 4, 1, 0) + 0.1)
bar_chart.X3 <- barplot(X3_sorted$X3, names.arg = X3_sorted$`Regencies/Cities`,
                        las = 2, ylim = c(0, 250))
#Show the number of cases of each object
text(x = bar_chart.X3 + 0.2, y = X3_sorted$X3 + 7, labels = X3_sorted$X3, 
     cex = 0.9, pos = 3, srt = 90)
#Show the average value
abline(h = mean(X3_sorted$X3), col = "red", lty = 2)
text(x = max(bar_chart.X3) - 1.3, y = mean(X3_sorted$X3), 
     labels = paste(round(mean(X3_sorted$X3), 0)), pos = 3, cex = 0.9)

#Malaria
#Sort data from highest to lowest
X4_sorted <- input_data[order(input_data$X4, decreasing = TRUE), ]
#Create a bar chart
par(mar = c(11, 4, 1, 0) + 0.1)
bar_chart.X4 <- barplot(X4_sorted$X4, names.arg = X4_sorted$`Regencies/Cities`,
                        las = 2, ylim = c(0, 50))
#Show the number of cases of each object
text(x = bar_chart.X4 + 0.2, y = X4_sorted$X4 + 1, labels = X4_sorted$X4, 
     cex = 0.9, pos = 3, srt = 90)
#Show the average value
abline(h = mean(X4_sorted$X4), col = "red", lty = 2)
text(x = max(bar_chart.X4) - 1.3, y = mean(X4_sorted$X4), 
     labels = paste(round(mean(X4_sorted$X4), 0)), pos = 3, cex = 0.9)

#Outlier Detection
#Mahalanobis Distance
mahalanobis_distance = mahalanobis(x = data, center = colMeans(data),
                                   cov = cov(data))
print(mahalanobis_distance)
#Outlier Boundary
boundary = qchisq(p = 0.95, df = ncol(data)) 
print(boundary)
#Outlier
data[mahalanobis_distance > boundary, ]

#Nonmulticollinearity Assumption
#Pearson Correlation
pearson = cor(data, method = "pearson")
print(pearson)
#T-Test Statistics
t_count.X1X1 = cor.test(data$X1, data$X1)
print(t_count.X1X1)
t_count.X1X2 = cor.test(data$X1, data$X2)
print(t_count.X1X2)
t_count.X1X3 = cor.test(data$X1, data$X3)
print(t_count.X1X3)
t_count.X1X4 = cor.test(data$X1, data$X4)
print(t_count.X1X4)
t_count.X2X2 = cor.test(data$X2, data$X2)
print(t_count.X2X2)
t_count.X2X3 = cor.test(data$X2, data$X3)
print(t_count.X2X3)
t_count.X2X4 = cor.test(data$X2, data$X4)
print(t_count.X2X4)
t_count.X3X3 = cor.test(data$X3, data$X3)
print(t_count.X3X3)
t_count.X3X4 = cor.test(data$X3, data$X4)
print(t_count.X3X4)
t_count.X4X4 = cor.test(data$X4, data$X4)
print(t_count.X4X4)
#T-Table
t_table <- qt(0.05/2,27-2,lower.tail = FALSE)
print(t_table)

#Principal Component Analysis
PCA = princomp(data, cor = TRUE, scores = TRUE)
print(PCA$loadings)
summary(PCA)
#Principal Component Scores
new_data = as.data.frame(PCA$scores)
head(new_data)

#Euclidean Distance
euclidean = dist(new_data, method = "euclidean")
print(euclidean)

#K-Medoids
#Clustering
kmedoids <- pam(new_data, 4, metric = "euclidean", medoids = c(9, 5, 7, 19))
summary(kmedoids)
cluster_kmedoids <- data.frame(input_data$`Regencies/Cities`, kmedoids$cluster)
names(cluster_kmedoids) <- c("Regencies/Cities", "Cluster")
print(cluster_kmedoids)
#Plot
fviz_cluster(kmedoids, data = new_data, geom = "point", ellipse = FALSE, 
             show.clust.cent = FALSE, ggtheme = theme_classic(), stand = FALSE)

#DBSCAN
#Clustering
#k = 3
euclidean_k3 = kNNdist(new_data, k = 3)
print(euclidean_k3)
#K-distance Graph
kNNdistplot(new_data, k = 3)
#Border Point
abline(v = 21)
#Temporary Epsilon Value
abline(h = 1.42, col = "red", lty = 2)
abline(h = 1.27, col = "red", lty = 2)
abline(h = 1.22, col = "red", lty = 2)
abline(h = 1.19, col = "red", lty = 2)
abline(h = 1.18, col = "red", lty = 2)
abline(h = 1.12, col = "red", lty = 2)
abline(h = 1.10, col = "red", lty = 2)
abline(h = 0.98, col = "red", lty = 2)
abline(h = 0.93, col = "red", lty = 2)
abline(h = 0.84, col = "red", lty = 2)
abline(h = 0.70, col = "red", lty = 2)
abline(h = 0.68, col = "red", lty = 2)
abline(h = 0.59, col = "red", lty = 2)
abline(h = 0.58, col = "red", lty = 2)
abline(h = 0.51, col = "red", lty = 2)
abline(h = 0.48, col = "red", lty = 2)
#Cluster
for (epsilon in c(1.42, 1.27, 1.22, 1.19, 1.18, 1.12, 1.10, 0.98, 0.93, 0.84,
                  0.70, 0.68, 0.59, 0.58, 0.51, 0.48)) {
  print(fpc::dbscan(new_data, eps = epsilon, MinPts = 3))
}

#Clustering
#k = 4
euclidean_k4 = kNNdist(new_data, k = 4)
print(euclidean_k4)
#K-distance Graph
kNNdistplot(new_data, k = 4)
#Border Point
abline(v = 24)
#Temporary Epsilon Value
abline(h = 2.13, col = "red", lty = 2)
abline(h = 2.09, col = "red", lty = 2)
abline(h = 1.97, col = "red", lty = 2)
abline(h = 1.64, col = "red", lty = 2)
abline(h = 1.53, col = "red", lty = 2)
abline(h = 1.47, col = "red", lty = 2)
abline(h = 1.46, col = "red", lty = 2)
abline(h = 1.37, col = "red", lty = 2)
abline(h = 1.27, col = "red", lty = 2)
abline(h = 1.20, col = "red", lty = 2)
abline(h = 1.13, col = "red", lty = 2)
abline(h = 1.01, col = "red", lty = 2)
abline(h = 0.83, col = "red", lty = 2)
abline(h = 0.79, col = "red", lty = 2)
abline(h = 0.65, col = "red", lty = 2)
abline(h = 0.62, col = "red", lty = 2)
abline(h = 0.60, col = "red", lty = 2)
#Cluster
for (epsilon in c(2.13, 2.09, 1.97, 1.64, 1.53, 1.47, 1.46, 1.37, 1.27, 1.20, 
                  1.13, 1.01, 0.83, 0.79, 0.65, 0.62, 0.60)) {
  print(fpc::dbscan(new_data, eps = epsilon, MinPts = 4))
}

#Best MinPts and Epsilon Values
dbscan <- dbscan(new_data, eps = 1.37, MinPts = 4)
print(dbscan)
#Cluster
cluster_dbscan <- data.frame(input_data$`Regencies/Cities`, dbscan$cluster)
names(cluster_dbscan) <- c("Regencies/Cities", "Cluster")
print(cluster_dbscan)
#Plot
fviz_cluster(dbscan, data = new_data, geom = "point", ellipse = FALSE, 
             show.clust.cent = FALSE, ggtheme = theme_classic(), stand = FALSE)

#Cluster Validation
#K-Medoids
silhouette_kmedoids <- silhouette(kmedoids$cluster, dist(new_data))
silhouette_kmedoids <- summary(silhouette_kmedoids)$avg.width
print(silhouette_kmedoids)
#DBSCAN
silhouette_dbscan <- silhouette(dbscan$cluster, dist(new_data))
silhouette_dbscan <- summary(silhouette_dbscan)$avg.width
print(silhouette_dbscan)

#Selection of a Better Method
comparison <- data.frame(
  methods = c("K-Medoids", "DBSCAN"),
  silhouette = c(silhouette_kmedoids, silhouette_dbscan)
)
print(comparison)

#Characteristics
#Cluster 1
cluster_1 = read_excel("D:/04. KERJA/Portofolio/Communicable diseases in West Java (2021)/Communicable Diseases West Java Dataset.xlsx",
                       sheet = "Cluster 1")
data_cluster1 = as.data.frame(cluster_1)
head(data_cluster1)
average_cluster1 = colMeans(data_cluster1[,-1])
round(average_cluster1, 2)

#Cluster 2
cluster_2 = read_excel("D:/04. KERJA/Portofolio/Communicable diseases in West Java (2021)/Communicable Diseases West Java Dataset.xlsx",
                       sheet = "Cluster 2")
data_cluster2 = as.data.frame(cluster_2)
head(data_cluster2)
average_cluster2 = colMeans(data_cluster2[,-1])
round(average_cluster2, 2)

#Cluster 3
cluster_3 = read_excel("D:/04. KERJA/Portofolio/Communicable diseases in West Java (2021)/Communicable Diseases West Java Dataset.xlsx",
                       sheet = "Cluster 3")
data_cluster3 = as.data.frame(cluster_3)
head(data_cluster3)
average_cluster3 = colMeans(data_cluster3[,-1])
round(average_cluster3, 2)

#Cluster 4
cluster_4 = read_excel("D:/04. KERJA/Portofolio/Communicable diseases in West Java (2021)/Communicable Diseases West Java Dataset.xlsx",
                       sheet = "Cluster 4")
data_cluster4 = as.data.frame(cluster_4)
head(data_cluster4)
average_cluster4 = colMeans(data_cluster4[,-1])
round(average_cluster4, 2)
