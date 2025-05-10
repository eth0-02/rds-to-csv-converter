# Define the full path to your .rds file
rds_file_path <- "C:/Users/Kostas/Desktop/bup/python/iwmi/csv/hydroshed_wgs84_month75.rds"

# Define the output CSV file path
output_csv_path <- "C:/Users/Kostas/Desktop/bup/python/iwmi/csv/output.csv"

# Check if the .rds file exists at the specified path
if (!file.exists(rds_file_path)) {
  stop(paste("Error: The .rds file was not found at:", rds_file_path))
}

# Load the .rds file using the full path
tryCatch({
  data <- readRDS(rds_file_path)
}, error = function(e) {
  stop(paste("Error loading the .rds file:", e$message))
})

# Check if the loaded data is a data frame (most common for CSV conversion)
if (!is.data.frame(data)) {
  warning("Warning: The loaded .rds file does not contain a data frame. Attempting to convert as is, but the output might not be in the expected CSV format. Check the structure using str(data).")
}

# Write the data to the specified CSV file path
tryCatch({
  write.csv(data, output_csv_path, row.names = FALSE)
}, error = function(e) {
  stop(paste("Error writing to the CSV file:", e$message))
})

# Print a confirmation message with the output path
cat(paste("Successfully converted '", basename(rds_file_path), "' and saved it to:", output_csv_path, "\n"))
