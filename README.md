# CLUSTER ANALYSIS OF K-MEDOIDS AND DBSCAN FOR REGENCIES/CITIES GROUPING IN WEST JAVA BASED ON COMMUNICABLE DISEASES
<p align="justify">
  This project uses R programming language to process data and QGIS to map the clustering results.
</p>

## INTRODUCTION
<p align="justify">
  Sustainable Development Goals (SDGs) are goals or actions designed globally to build and improve people's quality of life. The SDGs have 17 goals and 169 targets expected to be achieved by 2030. Goal 3 focuses on health to ensure healthy lives and improve the well-being of all people of all ages. Target 3.3 of the SDGs is to end the epidemics of AIDS, tuberculosis, malaria, and neglected tropical diseases and combat hepatitis, waterborne diseases, and other communicable diseases. The types of communicable diseases focused on achieving these targets are tuberculosis, HIV, hepatitis B, leprosy, malaria, and filariasis.
</p>

<p align="justify">
  Indonesia is facing a double burden of diseases, namely a relatively high number of communicable diseases and an increase in non-communicable diseases. Based on the nature of transmission, diseases are divided into two types, namely communicable and non-communicable. Communicable diseases are caused by pathogenic microorganisms, such as viruses, bacteria, and fungi, transmitted through infected humans or animals and contaminated inanimate objects.
</p>

<p align="justify">
  Indonesia has a large population and a broad geographical location. This causes population movement, which can impact the rapid transmission of disease. Indonesia is an archipelago, which can be a challenge in preventing and controlling communicable diseases due to the affordability of different regions. The province with the largest population in Indonesia is West Java. In 2022, the population in West Java reached 49.41 million people. The province with the second highest population density in Indonesia is West Java, which is 1,334 people/km<sup>2</sup>, with an area of 37,044.86 km<sup>2</sup>. High population density is a factor in the spread of disease. The West Java Provincial Health Office has made communicable diseases a priority issue. 
</p>

<p align="justify">
  The spread of disease can be used as a characteristic to categorize an area. Cluster analysis can be used to group objects into several clusters based on specific traits.
</p>

## DATA AND METHOD
### Data
<p align="justify">
  The data used in this study is secondary data obtained from <a href="https://opendata.jabarprov.go.id/id/hasil-pencarian?topic=2&region=1">Open Data Jabar</a>, namely data on the number of communicable disease cases in 2021. The data used were 27 regencies/cities in West Java, consisting of 9 cities and 18 regencies. The variables used are the types of communicable diseases that are the focus in achieving target 3.3 of the SDGs as presented below.
</p>

| Variable | Description | Unit |
| --- | --- | --- |
| $X_1$ | Number of tuberculosis cases | People |
| $X_2$ | Number of HIV cases | People |
| $X_3$ | Number of leprosy cases | People |
| $X_4$ | Number of malaria cases | People |

### Method
<p align="justify">
  The steps used in this research are as follows.
1. Collecting data based on research variables.
2. Perform descriptive statistical analysis on each variable.
3. Perform outlier detection by calculating Mahalanobis distance.
4. Checking the assumption of non-multicollinearity using Pearson correlation.
5. If there is a correlation, it is handled using principal component analysis.
6. Perform cluster analysis using the K-Medoids method.
7. Perform cluster analysis using the DBSCAN method.
8. Calculate the cluster validity value with the Silhouette coefficient.
9. Select the better cluster between K-Medoids and DBSCAN based on the Silhouette coefficient value.
10. Mapping regencies/cities in West Java based on the better cluster.
</p>

## RESULTS AND DISCUSSION
### Descriptive Statistics
#### 1. Number of Tuberculosis Cases
<p align="justify">
  The figure below shows that most West Java tuberculosis patients were 3,306. The lowest number of tuberculosis cases is in Banjar City, with 269 people, while the highest is in Bogor Regency, with 11,946 people.
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/02c04d36-2531-4e6f-a6c0-4dcc4f2dfc09" width="50%"/>
</p>

#### 2. Number of HIV Cases
<p align="justify">
  The figure below shows that most West Java HIV patients were 168. The lowest number of HIV cases is in Pangandaran Regency, with 4 people, while the highest is in Bogor Regency, with 430 people.
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/3e1759a7-8922-41db-bf5f-a3d0e4f1b221" width="50%"/>
</p>

#### 3. Number of Leprosy Cases
<p align="justify">
  The figure below shows that most West Java leprosy patients were 49. The lowest number of leprosy cases is in West Bandung Regency and Cimahi City, with 0 people, while the highest is in Bogor Regency, with 220 people.
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/b550c62f-406f-48c1-b073-64a21fee591a" width="50%"/>
</p>

#### 4. Number of Malaria Cases
<p align="justify">
  The figure below shows that most West Java leprosy patients were 7. The lowest number of leprosy cases is in 8 regencies/cities, with 0 people, while the highest is in Cimahi City, with 43 people.
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/6a028000-6a3d-4790-a960-94e8f60a9b8a" width="50%"/>
</p>

### Outlier Detection
<p align="justify">
  The objects presented in the table below are identified as outliers because they have Mahalanobis distance values > $\chi^2_{27;0.05}$ (9.49). Therefore, K-Medoids and DBSCAN can be applied because they are robust to outliers.
</p>

| Regencies/Cities | Mahalanobis Distance |
| --- | --- |
| Bogor Regency  | 12.38  |
| Indramayu Regency  | 13.45  |
| Bandung City  | 12.50  |
| Depok City  | 15.66  |

### Nonmulticollinearity Assumption
<p align="justify">
  The hypothesis tested is as follows.
</p>

$H_0: \rho = 0$ (there is no correlation between variables)

$H_1: \rho \neq 0$ (there is a correlation between variables)

<p align="justify">
  The $\alpha$ value used is 0.05. The results of the p-value calculation are presented in the table below. Because there is a p-value < 0.05, then reject $H_0$, which means that there is a correlation between the variables. Therefore, it is necessary to conduct a principal component analysis to deal with the problem of multicollinearity.
</p>
    
| Variable | $X_1$ | $X_2$ | $X_3$ | $X_4$ |
| --- | --- | --- | --- | --- |
| $X_1$ | | | | |
| $X_2$ | <ins>0.01</ins> | | | |
| $X_3$ | <ins>0.02</ins> | <ins>0.01</ins> | | |
| $X_4$ | 0.80 | 0.15 | 0.71 | |

### Principal Component Analysis
<p align="justify">
  The results of the principal component analysis calculations are presented in the table below.
</p>

| Variable | $X_1$ | $X_2$ | $X_3$ | $X_4$ |
| --- | --- | --- | --- | --- |
| $X_1$ | 0.57 | 0.21 | 0.71 | 0.36 |
| $X_2$ | 0.60 | -0.28 | 0.00 | -0.75 |
| $X_3$ | 0.56 | 0.26 | -0.70 | 0.36 |
| $X_4$ | 0.11 | -0.90 | 0.00 | 0.42 |
| Eigen value | 1.39 | 1.06 | 0.74 | 0.62 |
| Proportion of variance | 0.49 | 0.28 | 0.13 | 0.10 |
| Cumulative proportion | 0.49 | 0.77 | 0.90 | 1.00 |

<p align="justify">
  Based on the table above, the principal component equation is formed as follows.
</p>

$PC_1 = 0.57X_1 + 0.21X_2 + 0.71X_3 + 0.36X_4$

$PC_2 = 0.60X_1 - 0.28X_2 - 0.75X_4$

$PC_3 = 0.56X_1 + 0.26X_2 - 0.70X_3 + 0.36X_4$

$PC_4 = 0.11X_1 - 0.90X_2 + 0.42X_4$

<p align="justify">
  The main components used are as many as the initial variables, namely 6 because this analysis aims to eliminate the correlation between variables. Hence, there is no need to reduce the variables. After obtaining the principal component equation, a substitution is made to the principal component equation to obtain the principal component score, which is used as new data for further analysis.
</p>

### K-Medoids
<p align="justify">
  Previous research by Septianingsih (2022) related to grouping regencies/cities in East Java based on the level of communicable disease cases with average linkage resulted in an optimal number of clusters of 4. Therefore, the determination of the number of clusters in this study with K-Medoids is 4 clusters. Then, the Euclidean distance between the object and the medoid is calculated, and each object is grouped into a cluster based on the closest medoid distance. The same steps are performed on the new medoid candidates. The objects selected as new medoid candidates were West Bandung Regency for cluster 1, Purwakarta Regency for cluster 2, Indramayu Regency for cluster 3, and Cimahi City for cluster 4. The medoid selection iteration process is stopped because of the value of S > 0. The results of clustering with K-Medoids are presented in the table below.
</p>

| Cluster | Number of Members | Members |
| --- | --- | --- |
| 1 | 7 regencies/cities | Bogor Regency, Cirebon Regency, Indramayu Regency, Subang Regency, Karawang Regency, Bekasi Regency, Bekasi City |
| 2 | 6 regencies/cities | Sukabumi Regency, Cianjur Regency, Bandung Regency, Garut Regency, Bandung City, Cirebon City |
| 3 | 11 regencies/cities | Tasikmalaya Regency, Ciamis Regency, Kuningan Regency, Majalengka Regency, Sumedang Regency, Purwakarta Regency, West Bandung Regency, Pangandaran Regency, Sukabumi City, Tasikmalaya City, Banjar City |
| 4 | 3 regencies/cities | Bogor City, Depok City, Cimahi City |

### DBSCAN
<p align="justify">
  In the k-distance graph, the x-axis is the point, and the y-axis is the Euclidean distance of the k-nearest neighbours. The border point is marked with a black line and is determined at the 21<sup>st</sup> point for a value of k = 3 and the 24<sup>th</sup> point for a value of k = 4 because the graph has a sharp rise. The value of k is considered as MinPts.
1. The dashed red lines in the figure below indicate the temporary Epsilon values of 1.42, 1.27, 1.22, 1.19, 1.18, 1.12, 1.10, 0.98, 0.93, 0.84, 0.70, 0.68, 0.59, 0.58, 0.51, and 0.48.
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/3858bc3d-a65c-44e8-9452-e54090f51f3e" width="50%"/>
</p>

<p align="justify">
2. The dashed red lines in the figure below indicate the temporary Epsilon values of 2.13, 2.09, 1.97, 1.64, 1.53, 1.47, 1.46, 1.37, 1.27, 1.20, 1.13, 1.01, 0.83, 0.79, 0.65, 0.62, and 0.60.
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/451b3dee-9cf8-44c7-9aae-801acc6c1e2b" width="50%"/>
</p>

<p align="justify">
  After determining the temporary MinPts and Epsilon, the best value is determined. The best MinPts and Epsilon can be determined by looking at the results of the cluster formed, which is a minimum of two. The best values obtained are MinPts of 4 and Epsilons of 1.37. 
</p>

<p align="justify">
  Furthermore, each point is categorized based on the Euclidean distance value. A point is a core point if the number of points in the Epsilon radius ≥ MinPts (4), a border point if the number of points in the Epsilon radius < MinPts (4) and neighbouring the core point, and noise if the number of points in the Epsilon radius < MinPts (4) and not neighbouring the core point. The cluster is first determined at the core point. If a regency/city becomes the first core point, it belongs to cluster 1. If a regency/city becomes the second core point and is not connected to a point in cluster 1, it belongs to cluster 2. Furthermore, if there is a connected point in cluster 1, the point is in cluster 1, while if there is a connected point in cluster 2, then the point is in cluster 2. 
</p>
    
<p align="justify">
  After all points are processed, it is found that there are 2 clusters formed with noise in as many as 8 regencies/cities. In this study, noise is not removed because it aims to cluster all regencies/cities in West Java based on communicable disease cases. The results of clustering with DBSCAN are presented in the table below.
</p>

| Cluster | Number of Members | Members |
| --- | --- | --- |
| 1 | 17 regencies/cities | Sukabumi Regency, Cianjur Regency, Bandung Regency, Garut Regency, Tasikmalaya Regency, Ciamis Regency, Kuningan Regency, Majalengka Regency, Sumedang Regency, Purwakarta Regency, West Bandung Regency, Pangandaran Regency, Sukabumi City, Cirebon City, Depok City, Tasikmalaya City, Banjar City |
| 2 | 4 regencies/cities | Cirebon Regency, Subang Regency, Karawang Regency, Bekasi Regency |
| Noise | 6 regencies/cities | Bogor Regency, Indramayu Regency, Bogor City, Bandung City, Bekasi City, Cimahi City |

### Selection of The Best Method
<p align="justify">
  The Silhouette coefficient values in the table below show that K-Medoids and DBSCAN produce weak cluster structures. K-Medoids have a higher Silhouette coefficient value than DBSCAN. Therefore, the clusters formed with K-Medoids are better than those formed by DBSCAN.
</p>

| Clustering Methods | Silhouette coefficient |
| --- | --- |
| K-Medoids  | 0.31  |
| DBSCAN  | 0.30  |

### Interpretation
<p align="justify">
  This project uses 4 variables to classify regencies/cities in West Java based on the number of communicable disease cases in 2021. The variables used were the number of tuberculosis cases ($X_1$), the number of HIV cases ($X_2$), the number of leprosy cases ($X_3$), and the number of malaria cases ($X_4$). The clustering results with K-Medoids are better than those with DBSCAN. Each cluster has different characteristics based on the number of communicable disease cases. The average calculation results of each variable in each cluster are presented in the table below.
</p>

| Variable | Cluster 1 | Cluster 2 | Cluster 3 | Cluster 4 |
| --- | --- | --- | --- | --- |
| $X_1$ | 5045.57 | <ins>5133.50</ins> | 1442.82 | 2421.33 |
| $X_2$ | 267.14 | 153.67 | 78.64 | <ins>291.33</ins> |
| $X_3$ | <ins>149.71</ins> | 11.67 | 13.27 | 16.67 |
| $X_4$ | 4.71 | 5.50 | 3.18 | <ins>26.67</ins> |

<p align="justify">
  Based on the table above, we can see that cluster 1 has the highest average number of HIV cases. The average number of tuberculosis cases is higher than clusters 3 and 4 but lower than cluster 2. The average number of leprosy cases is higher than clusters 2 and 3 but lower than cluster 4. The average number of malaria cases is higher than in cluster 3 but lower than in clusters 2 and 4. Therefore, cluster 1 is a group of regencies/cities with a quite high number of communicable disease cases.
</p>

<p align="justify">
  Cluster 2 has the highest average number of tuberculosis cases and the lowest number of leprosy cases. The average number of HIV cases is higher than in cluster 3 but lower than in clusters 1 and 4. The average number of malaria cases is higher than clusters 1 and 3 but lower than cluster 2. Therefore, cluster 2 is a group of regencies/cities with a quite low number of communicable disease cases. 
</p>

<p align="justify">
  Cluster 3 has the lowest average number of tuberculosis, HIV, and malaria cases. The average number of leprosy cases is higher than in cluster 2 but lower than in clusters 1 and 4. Therefore, cluster 3 is a group of regencies/cities with a low number of communicable disease cases. 
</p>

<p align="justify">
  Cluster 4 has the highest average number of HIV and malaria cases. The average number of tuberculosis cases is higher than in cluster 3 but lower than in clusters 1 and 2. The average number of leprosy cases is higher than clusters 2 and 3 but lower than cluster 1. Therefore, cluster 4 is a group of regencies/cities with a high number of communicable disease cases.
</p>

<p align="justify">
  The analysis results with K-Medoids are depicted using the distribution map in the figure below.
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/15a45d22-398b-4de0-8b5d-fb2f33505de5" width="75%"/>
</p>

## CONCLUSION
<p align="justify">
  Based on the discussion above, it can be concluded that grouping regencies/cities in West Java based on communicable disease cases with K-Medoids formed 4 clusters. Cluster 1 consists of 7 regencies/cities, cluster 2 consists of 6 regencies/cities, cluster 3 consists of 11 regencies/cities, and cluster 4 consists of 3 regencies/cities. Grouping regencies/cities in West Java based on communicable disease cases with DBSCAN formed 2 clusters with noise of 6 regencies/cities. Cluster 1 consists of 17 regencies/cities, and cluster 2 consists of 4 regencies/cities. K-Medoids is a better method than DBSCAN for clustering regencies/cities in West Java based on communicable disease cases. This is indicated by the higher Silhouette coefficient value.
</p>
