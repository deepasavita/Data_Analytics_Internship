# Task 1: Data Cleaning and Preprocessing

## 📝 Objective
Clean and prepare the `marketing_campaign.csv` dataset by handling missing values, removing duplicates, fixing inconsistent formats, and making the data ready for analysis.

---

## 🧰 Tools Used
- Python
- Pandas

---

## 🔧 Steps Performed

1. **Loaded the dataset** using `pd.read_csv()` with tab separator (`\t`).
2. **Removed duplicate rows** using `drop_duplicates()`.
3. **Checked for missing values** using `isnull().sum()` and removed them with `dropna()`.
4. **Standardized column names** by converting them to lowercase and replacing spaces with underscores.
5. **Converted date column** `Dt_Customer` to datetime format using `pd.to_datetime()`.
6. **Saved the cleaned dataset** to a new file `marketing_campaign_cleaned.csv`.

---

## 📁 Files Included
- `marketing_campaign.csv` – Raw dataset  
- `marketing_campaign_cleaned.csv` – Cleaned dataset  
- `clean_data.py` – Python script containing all preprocessing steps  
- `README.md` – Summary and explanation of the task

---

## 💬 Summary of Changes
- Removed **7 duplicate rows**
- Dropped **24 rows with missing values**
- Standardized **all column names**
- Converted **date format** to datetime for consistency

---

## ✅ Outcome
Successfully created a clean, structured dataset ready for analysis or modeling.

## 💡 What I Learned
This task taught me the real hustle behind clean data. It’s not just about writing code, it’s about thinking clearly, noticing patterns, and preparing your data so that future analysis doesn't become a headache. Learned a lot about Pandas and felt more confident with data cleaning!

