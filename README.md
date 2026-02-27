# Sneaker-Data-Exploration
## INTRODUCTION

The global sneaker market is highly competitive, with brands constantly balancing demand, inventory levels, and product condition. While some models generate strong revenue and high sell-through rates, others underperform due to damage rates, overproduction, or seasonal fluctuations.

This project explores a dataset of 500 sneaker models to analyze revenue performance, sales efficiency, inventory health, and seasonality patterns. The goal is to identify high-performing models, measure the financial impact of product damage, and uncover trends that influence overall profitability.

By combining SQL-based data aggregation with business-oriented metrics, this analysis highlights which models truly drive revenue and which factors may limit performance.

# TABLE OF CONTENT
- [INTRODUCTION](#INTRODUCTION)
- [DATASET INFORMATION](#DATASETINFORMATION)
- [DATA CLEANING & TRANSFORMATION](#DATA-CLEANING--TRANSFORMATION)


## DATASET INFORMATION 
- Source: [Kaggle – 500 Sneakers Dataset](https://www.kaggle.com/datasets/comhek/500-snickers-dataset?select=snicker_dataset_with_dates.csv)
- Rows: 500
#### FIELDS(after cleaning/transformation)
- Name 
- Type
- Total sold
- Total unsold
- Damaged
- Month
- Year
- Quarter
- Edition
- Price
- Gender
- Sales percent
- Damage percent
- Estimated revenue
- Unrealized revenue
- Unrealized Revenue(Damaged)
- Price bucket

## DATA CLEANING & TRANSFORMATION

Before building the dashboard, the dataset was cleaned and prepared to ensure analytical consistency and business relevance.

#### REMOVED COLUMNS 
The following columns were excluded as they did not add value to the intended level of analysis:

- `Snapshot_Date`
- `Manufacturing_Date`
- `Selling_Date`
- `Units_Received` (validated as identical to `total_produced`)
- `Performance_Score`
- `Sneaker_Grade`

Since the analysis focuses on monthly and quarterly trends, daily-level granularity was considered unnecessary.

#### RENAMING & STANDARTIZATION 

- `Unsold_Inventory` was renamed to `Total unsold` for consistency.
- `Gender` values were standardized to `M` and `F`.
- Special characters (apostrophes) were removed from product names to ensure compatibility with PostgreSQL.
- Revenue columns were formatted for clarity and better visualization in Tableau.

#### CRATED BUISNESS METRICS 

To enhance business analysis, additional calculated fields were introduced:

- **Unrealized Revenue**  
  `(total_produced - total_sold - damaged) * price`  
  Represents capital tied in unsold inventory.

- **Unrealized Revenue(Damaged)**  
  `damaged * price`  
  Estimates revenue lost due to damaged units.

