# Sneaker-data-exploration
## Project Overview

This project analyzes a dataset of 500 sneaker models to evaluate sales performance, revenue drivers, inventory efficiency, and seasonal demand patterns.

The objective is to identify top-performing models, assess operational risks such as damaged and unsold inventory, and understand how different editions and price segments impact overall profitability.

Data cleaning and transformation were performed in Power Query and PostgreSQL, and the final analytical dashboard was developed in Tableau to generate structured, business-oriented insights.

## Dataset Information
- Source: [Kaggle – 500 Sneakers Dataset](https://www.kaggle.com/datasets/comhek/500-snickers-dataset?select=snicker_dataset_with_dates.csv)
- Rows: 500
#### Fields(after cleaning/transformation)
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

## Data Cleaning & Transformation

Before building the dashboard, the dataset was cleaned and prepared to ensure analytical consistency and business relevance.

### Removed Columns
The following columns were excluded as they did not add value to the intended level of analysis:

- `Snapshot_Date`
- `Manufacturing_Date`
- `Selling_Date`
- `Units_Received` (validated as identical to `total_produced`)
- `Performance_Score`
- `Sneaker_Grade`

Since the analysis focuses on monthly and quarterly trends, daily-level granularity was considered unnecessary.

### Renaming & Standardization

- `Unsold_Inventory` was renamed to `Total unsold` for consistency.
- `Gender` values were standardized to `M` and `F`.
- Special characters (apostrophes) were removed from product names to ensure compatibility with PostgreSQL.
- Revenue columns were formatted for clarity and better visualization in Tableau.

### Created Business Metrics

To enhance business analysis, additional calculated fields were introduced:

- **Unrealized Revenue**  
  `(total_produced - total_sold - damaged) * price`  
  Represents capital tied in unsold inventory.

- **Unrealized Revenue(Damaged)**  
  `damaged * price`  
  Estimates revenue lost due to damaged units.

