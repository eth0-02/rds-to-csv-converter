# rds-to-csv-converter

This R script converts a `.rds` file (a file format used by R to store R objects) into a comma-separated values (`.csv`) file. It includes basic error handling to ensure the script runs smoothly.

## Prerequisites

* **R** installed on your system. You can download it from [https://www.r-project.org/](https://www.r-project.org/).
* **RStudio** (optional but highly recommended for a better R development experience). You can download it from [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/).

## How to Use

1.  **Save the Script:**
    * Save the provided R code below into a file named `rds_to_csv.R` (or any other name with a `.R` extension) on your local machine.

    ```R
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
    ```

2.  **Edit the Paths:**
    * **Before running the script**, you **must** modify the `rds_file_path` and `output_csv_path` variables to reflect the actual location of your `.rds` file and the desired location for the output `.csv` file on your system.

    ```R
    # **CHANGE THIS TO THE ACTUAL PATH OF YOUR .rds FILE**
    rds_file_path <- "/path/to/your/input.rds"

    # **CHANGE THIS TO THE DESIRED PATH FOR YOUR OUTPUT .csv FILE**
    output_csv_path <- "/path/to/your/output.csv"
    ```

    * **Important:** Use forward slashes (`/`) in your file paths, even on Windows.

3.  **Run the Script using RStudio (Recommended):**
    * Open RStudio.
    * Go to `File` -> `Open File...` and select the `rds_to_csv.R` file you saved.
    * Click the `Source` button (usually at the top of the script editor panel) to run the entire script.
    * Alternatively, you can run the script line by line by placing your cursor on a line and pressing `Ctrl + Enter` (Windows/Linux) or `Cmd + Enter` (macOS).

4.  **Run the Script from the R Command Line (Alternative):**
    * Open your terminal or command prompt.
    * Navigate to the directory where you saved the `rds_to_csv.R` file.
    * Run the command: `Rscript rds_to_csv.R`

## Output

Upon successful execution, the script will:

* Load the data from the specified `.rds` file.
* Save the data as a `.csv` file named `output.csv` (or the name you specified in `output_csv_path`) in the directory you defined.
* Print a confirmation message in the R console indicating the successful conversion and the location of the output `.csv` file.

## Error Handling

The script includes basic error handling:

* It checks if the input `.rds` file exists.
* It uses `tryCatch` to handle potential errors during the loading and writing processes.
* It provides a warning if the loaded `.rds` file does not contain a data frame.

## Contributing

Feel free to contribute to this script by suggesting improvements or reporting issues.

## License

This project is licensed under the GNU General Public License v3.0.  
See the [LICENSE](./LICENSE) file for details.
