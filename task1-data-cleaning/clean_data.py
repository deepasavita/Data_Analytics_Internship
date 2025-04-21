import pandas as pd

# Step 1: Load the dataset
try:
    df = pd.read_csv("marketing_campaign.csv", sep="\t")  # CSV uses tab separator
    print("Dataset loaded successfully!")
except FileNotFoundError:
    print("File not found. Please check the path to the dataset.")
    exit()  # Exit if the file is not found

# Step 2: View basic info
print("Original Data:")
print(df.info())
print("\nFirst 5 Rows:")
print(df.head())

# Step 3: Remove duplicate rows
df = df.drop_duplicates()

# Step 4: Check for missing values
print("\nMissing Values:")
print(df.isnull().sum())

# Step 5: Fill or drop missing values
df = df.dropna()  # You can also use df.fillna() if needed

# Step 6: Standardize column names
df.columns = df.columns.str.strip().str.lower().str.replace(" ", "_")

# Step 7: Convert 'dt_customer' to datetime
df["dt_customer"] = pd.to_datetime(df["dt_customer"], errors="coerce")

# Step 8: Confirm cleaned data
print("\nCleaned Data Info:")
print(df.info())

# Step 9: Save cleaned data
df.to_csv("marketing_campaign_cleaned.csv", index=False)

print("\n✅ Data cleaned and saved as 'marketing_campaign_cleaned.csv'")
