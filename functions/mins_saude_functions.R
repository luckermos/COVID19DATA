.download_caso_br <- function() {
  url <- "https://data.brasil.io/dataset/covid19/caso.csv.gz"
  download.file(url, destfile = "caso.gz")
  R.utils::gunzip("caso.gz", destname = "caso.csv")
  df <- readr::read_csv("caso.csv")
  file.remove("caso.csv")
  return(df)
}

.download_caso_full_br <- function() {
  url <- "https://data.brasil.io/dataset/covid19/caso_full.csv.gz"
  download.file(url, destfile = "caso_full.gz")
  R.utils::gunzip("caso_full.gz", destname = "caso_full.csv")
  df <- readr::read_csv("caso_full.csv")

  file.remove("caso_full.csv")
  return(df)
}

.download_obito_cartorio_br <- function() {
  url <- "https://data.brasil.io/dataset/covid19/obito_cartorio.csv.gz"
  download.file(url, destfile = "obito_cartorio.gz")
  R.utils::gunzip("obito_cartorio.gz", destname = "obito_cartorio.csv")
  df <- readr::read_csv("obito_cartorio.csv")
  file.remove("obito_cartorio.csv")
  return(df)
}

