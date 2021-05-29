.download_ms_br <- function(){
  url <-  "https://xx9p7hp1p7.execute-api.us-east-1.amazonaws.com/prod/PortalGeral"

  covid <- GET(url, # a chave tá no header, então add header
               add_headers("x-parse-application-id" = "unAFkcaNDeXajurGB7LChj8SgQYS2ptm"))
  
  results <- covid %>% 
    content()
  
  url_data <- results$results[[1]]$arquivo$url
  
  download(url_data, dest="dataset.zip", mode="wb") 
  utils::unzip("dataset.zip", exdir = "data_ms-br")
  
  filenames <- list.files("data_ms-br", pattern="*.csv", full.names=TRUE)
  
  ldf <- lapply(filenames, read_files_csv)
  
  df <- bind_rows_list(ldf)

  lapply(filenames, file.remove)
  file.remove("dataset.zip")

  return(df)
  
}

read_files_csv <- function(path){
  read_delim(path, delim=";", locale = locale(encoding = "UTF-8"), guess_max = 50000)
}

bind_rows_list <- function(list){
  n <- length(list)
  
  df <- list[[1]][1,]
  
  for(i in 1:n){
    df <- dplyr::bind_rows(df, list[[i]])
  }
  
  df <- df[-1,]
  
  return(df)
  
}
