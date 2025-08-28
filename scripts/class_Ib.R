setwd("C:/AI_Omics_Internship_2025/Module_II")
getwd()
# creating subfolders
dir.create("raw_data", showWarnings = FALSE)
dir.create("clean_data", showWarnings = FALSE)
dir.create("scripts", showWarnings = FALSE)
dir.create("results", showWarnings = FALSE)
dir.create("plots", showWarnings = FALSE)

# cheking
list.dirs(getwd(), recursive = FALSE)

# Load the dataset from raw_data folder
patient_data <- read.csv("raw_data/patient_info.csv")

# View first few rows of the dataset
head(patient_data)

# Check overall structure of the dataset
str(patient_data)

# Get summary statistics of all columns
summary(patient_data)
list.files("raw_data")
patient_data <- read.csv("raw_data/patient_info.csv")
str(patient_data)
# Load dataset
patient_data <- read.csv("raw_data/patient_info.csv")

# Inspect dataset
head(patient_data)      # First few rows
str(patient_data)       # Structure of dataset (data types)
summary(patient_data)   # Summary statistics
# Convert variables to appropriate data types
patient_data$gender <- as.factor(patient_data$gender)
patient_data$diagnosis <- as.factor(patient_data$diagnosis)

# Create new binary variable for smoker status (1 = Yes, 0 = No)
patient_data$smoker_binary <- ifelse(patient_data$smoker == "Yes", 1, 0)

# Check structure again
str(patient_data)
# Save the cleaned dataset into clean_data folder
write.csv(patient_data, "clean_data/patient_info_clean.csv", row.names = FALSE)
# Capture summary statistics of the cleaned dataset
summary_stats <- capture.output(summary(patient_data))

# Save the summary in the results folder
writeLines(summary_stats, "results/patient_info_summary.txt")
