# Astroinformatics Practices

This repository contains scripts and outputs from 4 practices of the Astroinformatics course, where we work with a TESS light curve analysis project. The course is part of the Master's program in Astronomy at Universidad de Antofagasta. Each practice is organized into its own folder (`practice1/`, `practice2/`, etc.) and includes code, scripts, figures, and data files.

 **Important**
These codes were designed specifically for TESS light curves, which use columns such as `TIME`, `PDCSAP_FLUX` and `PDCSAP_FLUX_ERR`. If you want to use this script with data from other telescopes (e.g. Kepler, CHEOPS or your own observations), you will probably have to adapt the column names or the general input format. Otherwise, you might get errors like `KeyError` or empty plots.



---
First you must install the packages that are used in the codes, these are in the requirements.txt file and to install it you must type in the terminal:
`pip install -r requirements.txt`

---
## 📁 practice1

This folder contains the initial preparation of TESS light curve data. The steps involved are as follows:

1. **Download light curves**:  
   - Use the Bash script `tesscurl_sector_73_lc.sh` to download light curve `.fits` files from TESS Sector 73 via the MAST archive.

2. **Convert `.fits` to `.csv`**:  
   - Open the `.fits` files in TOPCAT to convert them into `.csv` format.
   - Select only the relevant columns (e.g., TIME, FLUX, FLUX_ERR).

3. **Organize the `.csv` files**:  
   - Use a Bash script to generate a list of all `.csv` filenames.
   - Use another script to split this list into smaller files containing 5 entries each, for easier batch processing.

These steps prepare the data for further analysis in the following practices.

---

## 📁 practice2

This folder includes Bash scripts for automated data preparation:

- Scripts to:
  - Change delimiters in `.csv` files.
  - Rename file extensions from `.csv` to `.lc`.
  - Remove irrelevant columns from light curve files.
- A script that classifies stars into spectral types based on temperature.
- A script that calculates Julian Dates from calendar dates.

---

## 📁 practice3

This practice focuses on Python-based analysis of light curves:

- Scripts to plot light curves from `.lc` files with improved readability.
- Code to identify and highlight outliers in the plots.
- Functions to compute basic light curve statistics (e.g., amplitude, standard deviation).

---

## 📁 practice4

This final practice focuses on documentation and repository organization:

- Creation of this GitHub repository containing all previous graded practices.
- A short documentation file describing the light curve processing steps.
- A list of defined test cases to verify the correctness of light curve processing scripts.

---

Each folder is self-contained and corresponds to one graded practice of the course.


## Test Case Identification

When processing TESS light curves, it is important to identify and anticipate common issues that can affect data quality or cause the code to fail. Below are a few critical edge cases that were considered during development:

### Case 1: Missing or unexpected column names

The script expects the input `.csv` files to include specific TESS columns such as `TIME`, `PDCSAP_FLUX`, and `PDCSAP_FLUX_ERR`. If any of these are missing—due to formatting issues or because the file comes from another telescope with a different structure (e.g., Kepler, CHEOPS)—the code will raise a `KeyError`.

**Possible consequence**: The script crashes without generating any plot.

**Tip**: To make the code compatible with other instruments, adjust the column names accordingly or implement a column mapping step.

---

### Case 2: Filename pattern does not match expected format

The script extracts an identifier from the filename using a regular expression based on the format `tess_lc_123456.csv`. If a file does not match this naming pattern (e.g., `lightcurve_final.csv`), the expression fails and an `AttributeError` is raised when trying to access `group(1)` from a `None` result.

**Possible consequence**: The plot title fails to render correctly, or the script stops with an error.

---

### Case 3: Empty DataFrame after NaN filtering

If a file contains too many `NaN` values in key columns, the DataFrame becomes empty after applying `dropna()`. Attempting to plot or process an empty DataFrame can result in silent failures or generate blank output files.

**Possible consequence**: A blank figure is saved, or runtime warnings/errors are triggered during further analysis.

**Tip**: Include a condition to skip files with empty DataFrames after cleaning.

---
