# Load necessary libraries
install.packages("readxl")
install.packages("dplyr")
install.packages("tidyr")
install.packages("janitor")
install.packages("lubridate")

library(readxl)
library(dplyr)
library(tidyr)
library(janitor)
library(lubridate)

# Set file path (update this if needed)
file_path <- "/Users/munizw/Documents/Wolf Parasites/Stage One/Copy of CL_SampleResults_COI.xlsx"

# Read the first sheet (update if necessary)
df <- read_excel (file_path, sheet = 1)

# View structure of the dataset
glimpse(df)

# Clean column names (make them consistent, lowercase, and underscore-separated)
df <- df %>%
  clean_names()  # Uses janitor::clean_names() to standardize column names

# Remove empty rows and columns
df <- df %>%
  remove_empty("rows") %>%
  remove_empty("cols")

# Handle missing values (modify based on dataset requirements)
df <- df %>%
  mutate(across(everything(), ~replace_na(., "Unknown")))  # Replace NA values with "Unknown"

# Convert date columns (if applicable)
df <- df %>%
  mutate(across(contains("date"), ymd, .names = "formatted_{.col}"))  # Convert date columns to Date format

# Convert categorical variables (modify based on actual column names)
df <- df %>%
  mutate(across(where(is.character), as.factor))  # Convert text columns to factors

# Remove duplicate rows
df <- df %>%
  distinct()

# Arrange data by a relevant column (update column name if needed)
df <- df %>%
  arrange(sample)  # Assuming "sample_id" is a key identifier

# Save the cleaned data to a new CSV file
write.csv(df, "/Users/munizw/GIT/Wolf Project/Cleaned_CL_SampleResults_COI.csv", row.names = FALSE)

# Print summary of cleaned data
print("Data cleaning complete! Summary of cleaned dataset:")
summary(df)

View(df)

