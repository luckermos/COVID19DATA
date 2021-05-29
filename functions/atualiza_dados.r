atualiza_dados_painel_covid <- function(){
  t <- download_dataset("jhu")
  
  saveRDS(t, "actual_data/covid_ms.rds")
  
  t <- download_dataset("ms-br")
  
  saveRDS(t, "actual_data/covid_jhu.rds")
  
}