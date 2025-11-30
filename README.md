Data Cleaning for Sales Transaction Dataset

In this project, I performed a comprehensive data cleaning process on a sales transaction dataset to improve its quality, consistency, and readiness for analysis.

Key Steps Performed

* Cleaned the **Item** column by removing rows containing invalid values such as `error`, `unknown`, and blank cells.
* Standardized numeric columns (**Quantity, Price, and Total Spent**) by replacing invalid string values with blanks to enable numerical processing.
* Reconstructed missing values using the logical relationship:

  * **Quantity × Price = Total Spent**
  * Filled missing *Total Spent* using:
    `IF(AND(Q<>"",P<>""), Q*P, T)`
  * Filled missing *Price* using:
    `IF(AND(T<>"",Q<>""), T/Q, P)`
* Removed rows where **Price = 0**, as it is considered an illogical value in a real-world sales context.
* Standardized missing or invalid entries in **Payment Method** (≈2,800 rows) and **Location** to a single category: `Unknown`.
* Dropped rows with missing, invalid, or unknown values in **Transaction Date**, since time-based information is critical for analysis.
* Removed rows that contained **more than two missing values** to improve overall dataset reliability.

### Outcome

After performing the cleaning process, the dataset became more consistent, reliable, and suitable for further analysis such as sales trend analysis, customer behavior insights, and payment method distribution.

This project demonstrates my ability to:

* Handle missing data effectively
* Apply logical assumptions responsibly
* Perform structured and systematic data cleaning
* Prepare raw data for analytical and visualization purposes

**Tools used:** Microsoft Excel(formulas), basic data analysis techniques
