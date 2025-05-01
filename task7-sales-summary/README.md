Sure! Here's a **Task 1: Data Cleaning and Preprocessing** in the format you requested:

---

## 📝 **Task 1: Data Cleaning and Preprocessing**

### **Objective**
Clean and prepare the **marketing_campaign.csv** dataset by handling missing values, removing duplicates, fixing inconsistent formats, and making the data ready for analysis.

---

### 🧰 **Tools Used**
- **Python**
- **Pandas**

---

### 🔧 **Steps Performed**
1. **Loaded the dataset**:
   - Used `pd.read_csv()` with tab separator (`\t`) to load the dataset.
   
2. **Removed duplicate rows**:
   - Used `drop_duplicates()` to remove any duplicate rows from the dataset.

3. **Checked for missing values**:
   - Applied `isnull().sum()` to check for missing values across the columns.
   
4. **Dropped rows with missing values**:
   - Used `dropna()` to remove 24 rows that had missing values.

5. **Standardized column names**:
   - Converted all column names to lowercase and replaced spaces with underscores for consistency.

6. **Converted date column**:
   - Converted the `Dt_Customer` column to `datetime` format using `pd.to_datetime()` to ensure consistency in date handling.

7. **Saved the cleaned dataset**:
   - Saved the cleaned dataset to a new file: `marketing_campaign_cleaned.csv`.

---

### 📁 **Files Included**
- `marketing_campaign.csv` – Raw dataset.
- `marketing_campaign_cleaned.csv` – Cleaned dataset.
- `clean_data.py` – Python script containing all preprocessing steps.
- `README.md` – Summary and explanation of the task.

---

### 💬 **Summary of Changes**
- Removed **7 duplicate rows**.
- Dropped **24 rows with missing values**.
- Standardized **all column names** (lowercase and no spaces).
- Converted **date format** of `Dt_Customer` column to `datetime` for consistency.

---

### ✅ **Outcome**
Successfully created a **clean, structured dataset** ready for analysis or modeling.

---

### 💡 **What I Learned**
This task taught me the real hustle behind clean data. It’s not just about writing code, it’s about thinking clearly, noticing patterns, and preparing your data so that future analysis doesn't become a headache. Learned a lot about **Pandas** and felt more confident with **data cleaning**!

---

