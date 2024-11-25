
# Taxi Trip Data Analysis with Apache Spark and Neo4j

## Project Overview

This project analyzes taxi trip data using **Apache Spark** and **Neo4j** to uncover insights and optimize data processing performance. Key objectives include:

- Cleaning and preprocessing large taxi trip datasets.
- Comparing the performance of **Parquet** and **Delta** formats for distributed data processing.
- Graph-based analysis of taxi zones using Neo4j to identify community clusters and centrality.

---

## Features

### 1. Data Cleaning and Preprocessing
- Removed invalid records (e.g., zero distance, no passengers).
- Eliminated outliers.
- Added derived columns to enhance analysis.
- Joined trip data with taxi zone datasets.
- Computed unit profitability for each trip.

### 2. Dataset Summarization and Ranking
- Summarized trip data for each zone.
- Ranked zones based on:
  - Total trip volume.
  - Average profitability.
  - Total passenger volume.
- Measured task-specific execution times for various dataset sizes and formats.

---

### 3. Format Performance Comparison
#### Metrics Evaluated:
- Number of rows processed.
- Execution time.
- Time per million records.

#### Key Findings:
- **Delta format** consistently outperformed **Parquet** in execution time and scalability, especially with larger datasets:
  - Smallest dataset: Delta was **1.5x faster** than Parquet.
  - Largest dataset: Delta processed **48x faster** than Parquet.

---

### 4. Graph-Based Analysis with Neo4j
#### Algorithms and Queries:
1. **Louvain Algorithm**:
   - Detects communities in an undirected graph weighted by the "trips" property.
   - Outputs:
     - Number of communities in stats mode.
     - Zone-community mapping in stream mode.

2. **PageRank Centrality**:
   - Computes centrality in a directed graph.
   - Outputs:
     - Min/max centrality scores in stats mode.
     - Zone-centrality mapping in stream mode.

3. **Top Centrality Zones**:
   - Identifies the top 3 centrality zones per community.
   - Combines community and centrality data for targeted insights.

#### Neo4j Workflow:
- Created in-memory graph projections.
- Estimated memory usage for algorithms (optional).
- Ran algorithms in stats and stream modes.
- Exported results to CSV for analysis.

---

## Technologies Used
- **Apache Spark**: For distributed data processing and format comparison.
- **Neo4j**: For graph-based data analysis and visualization.
- **Delta Format**: To optimize query performance and scalability.
- **Python**: Implemented data cleaning, analysis, and performance measurements.
- **Cypher Queries**: Neo4j query language for graph manipulation and insights.

---

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-repo/taxi-data-analysis.git
cd taxi-data-analysis
```

### 2. Prerequisites
Ensure you have the following installed:
- Python 3.x
- Apache Spark
- Neo4j with the Graph Data Science (GDS) library
- Jupyter Notebook or compatible IDE

### 3. Install Dependencies
Install required Python libraries:
```bash
pip install -r requirements.txt
```

### 4. Prepare the Dataset
- Place raw taxi trip data files in the `data/` folder.
- Update paths in the Jupyter Notebook (`CSC8101-spark-coursework.ipynb`) as needed.

### 5. Run the Notebook
Launch the analysis:
```bash
jupyter notebook CSC8101-spark-coursework.ipynb
```

### 6. Neo4j Setup
- Start the Neo4j server.
- Import data into Neo4j and execute the provided Cypher queries.

---

## Repository Structure
```plaintext
|-- data/                  # Raw and processed datasets
|-- notebooks/             # Jupyter notebooks for Spark analysis
|-- neo4j_queries/         # Cypher queries for Neo4j analysis
|-- results/               # Exported CSV files
|-- README.md              # Project documentation
|-- requirements.txt       # Python dependencies
```

---

## Results and Insights
- Delta format demonstrated superior performance for distributed data processing.
- Louvain and PageRank algorithms provided community and centrality insights for taxi zones.
- The analysis identified top-performing and most-connected zones, guiding operational strategies.

---

## Contributors
- **Rohit Kumar** - [LinkedIn](https://www.linkedin.com/in/rohit-kumar-contact) | [GitHub](https://github.com/mustang-raven999)

---

Feel free to ask questions or contribute to the project. 😊
