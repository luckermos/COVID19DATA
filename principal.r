carregar_funcoes <- function(path) {
  folder_files <- list.files(path)
  dir_files <- paste0(path, folder_files)
  tryCatch({
    lapply(dir_files, source)
  }, error = function(e) {
    warning(paste("Nenhum arquivo encontrado em", path))
  })
}

library(tidyverse)
library(progress)
library(httr)
library(jsonlite)
library(downloader)

carregar_funcoes("functions/")

atualiza_dados_painel_covid()
