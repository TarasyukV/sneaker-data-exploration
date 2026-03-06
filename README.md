# Sneaker-Data-Exploration
## DASHBOARD PREVIEW

<h3 align="center">Main Dashboard – Charts</h3>

<p align="center">
<img src="assets/main.jpg" width="900">
</p>

<h3 align="center">Top 10 Sneakers</h3>

<p align="center">
<img src="assets/top10.jpg" width="900">
</p>


# TABLE OF CONTENT
- [DASHBOARD LINK](#DASHBOARD LINK)
- [INTRODUCTION](#INTRODUCTION)
- [DATASET INFORMATION](#dataset-information)
- [DATA CLEANING & TRANSFORMATION](#DATA-CLEANING-TRANSFORMATION)
- [DASHBOARD STRUCTURE](#DASHBOARD-STRUCTURE)
- [TOOLS USED](#TOOLS-USED)
---


## DASHBOARD LINK 

You can explore the full interactive version of the dashboard on Tableau Public:

🔗 **[Open the Interactive Dashboard](https://public.tableau.com/app/profile/volodymyr.tarasyuk/viz/SneakersDashboard/Charts)**

The Tableau dashboard allows you to:
- Explore sneaker price trends
- Analyze brand distribution
- View the Top 10 most expensive sneakers
- Interact with filters and charts


## INTRODUCTION

The global sneaker market is highly competitive, with brands constantly balancing demand, inventory levels, and product condition. While some models generate strong revenue and high sell-through rates, others underperform due to damage rates, overproduction, or seasonal fluctuations.

This project explores a dataset of 500 sneaker models to analyze revenue performance, sales efficiency, inventory health, and seasonality patterns. The goal is to identify high-performing models, measure the financial impact of product damage, and uncover trends that influence overall profitability.

By combining SQL-based aggregation with interactive visualization in Tableau, this analysis highlights which models truly drive revenue and which operational factors may limit performance.


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
- Unrealized revenue(damaged)
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

Since the analysis focuses on monthly and quarterly trends, daily-level granularity was removed as unnecessary.

#### RENAMING & STANDARDIZATION

- `Unsold_Inventory` was renamed to `Total unsold` for consistency.
- `Gender` values were standardized to `M` and `F`.
- Special characters (apostrophes) were removed from product names to ensure compatibility with PostgreSQL.
- Revenue columns were formatted for clarity and better visualization in Tableau.

#### CREATED BUSINESS METRICS

To enhance business analysis, additional calculated fields were introduced:

- **Unrealized Revenue**  
  `(total_produced - total_sold - damaged) * price`  
  Represents capital tied in unsold items.

- **Unrealized Revenue(Damaged)**  
  `damaged * price`  
  Estimates revenue lost due to damaged units.

## DASHBOARD STRUCTURE

The interactive dashboard was designed to provide a clear overview of sneaker market performance, focusing on revenue generation, operational efficiency, and seasonal demand patterns.

The dashboard consists of several key analytical components:

### KPI Section

Three dynamic KPI cards summarize key performance indicators for the selected year:

- **Total Revenue** with year-over-year comparison
- **Average Price Trend**
- **Total Production with Damage Rate**

Each KPI reacts to the selected year parameter and highlights growth or decline using directional indicators.

### Revenue Comparison Chart

This chart compares **realized revenue** with **unrealized revenue** across the top-performing sneaker models.

Unrealized revenue includes:

- revenue lost due to damaged units
- revenue tied in unsold inventory

This visualization helps identify models where operational inefficiencies significantly impact profitability.

### Seasonality Analysis

A seasonal breakdown visualizes sales distribution across the four quarters of the year.

This allows the identification of peak demand periods and potential seasonal trends in sneaker sales.

### Top 10 Models Page

A secondary dashboard highlights the **Top 10 sneaker models** based on revenue performance.

The selection criteria include:

- above-average sales percentage
- below-average damage percentage

This ensures that only **efficient and high-performing models** are highlighted.

## TOOLS USED

- Microsoft Excel / Power Query (data preparation)
- Tableau (interactive dashboard and visualization)
- SQL (data aggregation and filtering)
- GitHub (project documentation and version control)
