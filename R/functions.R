# R/functions.R
get_data <- function(file) {
  readr::read_csv(file, 
                  col_types = readr::cols()) %>%
    filter(!is.na(Ozone))
}

fit_model <- function(data) {
  lm(Ozone ~ Temp, data) %>%
    coefficients()
}

plot_model <- function(model, data) {
  ggplot2::ggplot(data) +
    ggplot2::geom_point(ggplot2::aes(x = Temp, y = Ozone)) +
    ggplot2::geom_abline(intercept = model[1], slope = model[2])
}

download_data <- function() {
  # Aqui você pode colocar o código para baixar os dados
  # Exemplo fictício de download de dados
  data <- data.frame(id = 1:10, value = rnorm(10))
  return(data)
}


save_to_sql <- function(data) {
  db <- DBI::dbConnect(RSQLite::SQLite(), "database.sqlite")
  DBI::dbWriteTable(db, "table_name", data, overwrite = TRUE)
  DBI::dbDisconnect(db)
}
