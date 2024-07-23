# CLUSTER ANALYSIS OF K-MEDOIDS AND DBSCAN FOR REGENCIES/CITIES GROUPING IN WEST JAVA BASED ON COMMUNICABLE DISEASES
This project uses R programming language to process data and QGIS to map the clustering results.

## INTRODUCTION
  Sustainable Development Goals (SDGs) are a set of goals or actions designed globally to build and improve people's quality of life. The SDGs have 17 goals and 169 targets that are expected to be achieved by 2030. Goal 3 focuses on health, which is to ensure healthy lives and improve the well-being of all people of all ages. Target 3.3 of the SDGs is to end the epidemics of AIDS, tuberculosis, malaria, and neglected tropical diseases and combat hepatitis, waterborne diseases, and other infectious diseases. The types of infectious diseases focused on in an effort to achieve these targets are tuberculosis, HIV, hepatitis B, leprosy, malaria, and filariasis. 
  Indonesia is facing a double burden of diseases, namely a relatively high number of infectious diseases and an increase in non-communicable diseases.Based on the nature of transmission, diseases are divided into two types, namely infectious and non-communicable. Infectious diseases are diseases caused by pathogenic microorganisms, such as viruses, bacteria, and fungi that arise through transmission from infected humans or animals and contaminated inanimate objects. 
  Indonesia has a large population and a wide geographical location. This causes population movement which can have an impact on the rapid transmission of disease. Indonesia is an archipelago, which can be a challenge in the prevention and control of infectious diseases due to the affordability of different regions. The province with the largest population in Indonesia is West Java. In 2022, the population in West Java reached 49.41 million people. The province with the second highest population density in Indonesia is West Java, which is 1,334 people/km<sup>2</sup>, with an area of 37,044.86 km<sup>2</sup>. High population density is a factor in the spread of disease. The West Java Provincial Health Office has made infectious diseases a priority issue. 
  The spread of disease can be used as a characteristic to categorize an area. Cluster analysis can be used to group objects into several clusters based on certain characteristics.

## DATA AND METHOD
### Data
  The data used in this study is secondary data obtained from [Open Data Jabar](https://opendata.jabarprov.go.id/id/hasil-pencarian?topic=2&region=1), namely data on the number of infectious disease cases in 2021. The data used were 27 districts / cities in West Java, consisting of 9 cities and 18 districts. The variables used are the types of infectious diseases that are the focus in achieving target 3.3 of the SDGs as presented below.
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
6. Perform cluster analysis using K-Medoids method.
7. Perform cluster analysis using DBSCAN method.
8. Calculate the cluster validity value with the Silhouette coefficient.
9. Select the better cluster between K-Medoids and DBSCAN based on the Silhouette coefficient value.
10. Mapping districts/cities in West Java based on the better cluster.

## RESULTS AND DISCUSSION
### Descriptive Statistics
![Rplot66](https://github.com/user-attachments/assets/915d762c-3bcc-47aa-a0b1-6c73faf7ca8b)
