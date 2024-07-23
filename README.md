# CLUSTER ANALYSIS OF K-MEDOIDS AND DBSCAN FOR REGENCIES/CITIES GROUPING IN WEST JAVA BASED ON COMMUNICABLE DISEASES
This project uses R programming language to process data and QGIS to map the clustering results.

## INTRODUCTION
Sustainable Development Goals (SDGs) are goals or actions designed globally to build and improve people's quality of life. The SDGs have 17 goals and 169 targets expected to be achieved by 2030. Goal 3 focuses on health to ensure healthy lives and improve the well-being of all people of all ages. Target 3.3 of the SDGs is to end the epidemics of AIDS, tuberculosis, malaria, and neglected tropical diseases and combat hepatitis, waterborne diseases, and other communicable diseases. The types of communicable diseases focused on achieving these targets are tuberculosis, HIV, hepatitis B, leprosy, malaria, and filariasis.

Indonesia is facing a double burden of diseases, namely a relatively high number of communicable diseases and an increase in non-communicable diseases. Based on the nature of transmission, diseases are divided into two types, namely communicable and non-communicable. Communicable diseases are caused by pathogenic microorganisms, such as viruses, bacteria, and fungi, transmitted through infected humans or animals and contaminated inanimate objects.

Indonesia has a large population and a broad geographical location. This causes population movement, which can impact the rapid transmission of disease. Indonesia is an archipelago, which can be a challenge in preventing and controlling communicable diseases due to the affordability of different regions. The province with the largest population in Indonesia is West Java. In 2022, the population in West Java reached 49.41 million people. The province with the second highest population density in Indonesia is West Java, which is 1,334 people/km<sup>2</sup>, with an area of 37,044.86 km<sup>2</sup>. High population density is a factor in the spread of disease. The West Java Provincial Health Office has made communicable diseases a priority issue. 

The spread of disease can be used as a characteristic to categorize an area. Cluster analysis can be used to group objects into several clusters based on specific traits.

## DATA AND METHOD
### Data
  The data used in this study is secondary data obtained from [Open Data Jabar](https://opendata.jabarprov.go.id/id/hasil-pencarian?topic=2&region=1), namely data on the number of communicable disease cases in 2021. The data used were 27 regencies/cities in West Java, consisting of 9 cities and 18 regencies. The variables used are the types of communicable diseases that are the focus in achieving target 3.3 of the SDGs as presented below.
| Variable | Description | Unit |
| --- | --- | --- |
| X1  | Number of tuberculosis cases  | People |
| X2  | Number of HIV cases  | People |
| X3  | Number of leprosy cases  | People |
| X4  | Number of malaria cases  | People |

### Method
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
10. Mapping districts/cities in West Java based on the better cluster.

## RESULTS AND DISCUSSION
### Descriptive Statistics
#### 1. Number of Tuberculosis Cases (X1)
The figure below shows that most West Java tuberculosis patients were 3,306. The lowest number of tuberculosis cases is in Banjar City, with 269 people, while the highest is in Bogor Regency, with 11,946 people.
![Rplot74](https://github.com/user-attachments/assets/02c04d36-2531-4e6f-a6c0-4dcc4f2dfc09)

#### 2. Number of HIV Cases (X2)
The figure below shows that most West Java HIV patients were 168. The lowest number of HIV cases is in Pangandaran Regency, with 4 people, while the highest is in Bogor Regency, with 430 people.
![Rplot75](https://github.com/user-attachments/assets/3e1759a7-8922-41db-bf5f-a3d0e4f1b221)

### 3. Number of Leprosy Cases (X3)
The figure below shows that most West Java leprosy patients were 49. The lowest number of leprosy cases is in West Bandung Regency and Cimahi City, with 0 people, while the highest is in Bogor Regency, with 220 people.
![Rplot76](https://github.com/user-attachments/assets/b550c62f-406f-48c1-b073-64a21fee591a)

### 4. Number of Malaria Cases (X3)
The figure below shows that most West Java leprosy patients were 7. The lowest number of leprosy cases is in 8 regencies/cities, with 0 people, while the highest is in Cimahi City, with 43 people.
![Rplot77](https://github.com/user-attachments/assets/6a028000-6a3d-4790-a960-94e8f60a9b8a)

### Outlier Detection
The objects presented in the table below are identified as outliers because they have Mahalanobis distance values > $\chi^2_{27;0.05}$ (9.49). Therefore, the use of K-Medoids and DBSCAN can be applied because they are robust to outliers.
| Regencies/Cities | Mahalanobis Distance |
| --- | --- |
| Bogor Regency  | 12.38  |
| Indramayu Regency  | 13.45  |
| Bandung City  | 12.50  |
| Depok City  | 15.66  |

### Nonmulticollinearity Assumption
The hypothesis tested is as follows.

$H_0: \rho = 0$ (there is no correlation between variables)

$H_1: \rho \neq 0$ (there is a correlation between variables)

The $\alpha$ value used is 0.05. The results of the p-value calculation are presented in the table below.
