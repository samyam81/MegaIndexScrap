# MegaIndexScrap

## Introduction
This repository contains a Bash script designed to scrape files from a web directory on Mega.nz. The script is meant to be executed from the command line.

## Usage
To use this script, follow these steps:
1. Ensure you have the necessary permissions to execute the script.
2. Run the script with the desired Mega.nz directory URL as an argument.
   ```bash
   ./script.sh <Mega.nz_directory_URL>
   ```

## Script Explanation
The script `script.sh` contains the following functions:

### 1. `goinside`
This function is responsible for processing each file or subdirectory within the provided Mega.nz directory URL. It retrieves the content of the directory, identifies file and folder names, and recursively processes subdirectories.

### 2. `checkfolder`
This function checks whether the provided path corresponds to a folder or a file. If it's a folder, it calls the `goinside` function to process its contents recursively. If it's a file, it initiates the download process using `wget`.

### 3. `firstcurl`
This function is the entry point of the script. It retrieves the content of the initial Mega.nz directory specified by the user and calls the `checkfolder` function to begin processing its contents.

## Dependencies
- `curl`: Command-line tool for transferring data with URLs.
- `wget`: Command-line utility for downloading files from the web.

## Notes
- This script is designed to work specifically with Mega.nz directory structures.
- Ensure you have the necessary permissions and dependencies installed before using the script.
- Use caution and ensure compliance with the website's terms of service and legal regulations when scraping data from web directories.
