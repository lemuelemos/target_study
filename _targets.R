library(targets)
# library(tarchetypes) # Load other packages as needed.

# Set target options:
tar_option_set(
  packages = c("tibble","dplyr","DBI","RSQLite") 
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source("R/functions.R")
# tar_source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
list(
  tar_target(file, "data.csv", format = "file"),
  tar_target(data, get_data(file)),
  tar_target(model, fit_model(data)),
  tar_target(plot, plot_model(model, data)),
  tar_target(dados,download_data()),
  tar_target(svdados,save_to_sql(dados))
)
