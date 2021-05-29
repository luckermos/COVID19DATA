download_dataset <- function(dataset = "jhu") {

  if("jhu" %in% dataset) {
    df <- .download_jhu_dataset()
  }
  else if("ms-br" %in% dataset) {
    df <- .download_ms_br()
  }
  else if("google" %in% dataset) {
    df <- .download_google_mobility()
  }
  else if("caso_br" %in% dataset) {
    df <- .download_caso_br()
  }
  else if("caso_full_br" %in% dataset) {
    df <- .download_caso_full_br()
  }
  else if("obito_cartorio_br" %in% dataset) {
    df <- .download_obito_cartorio_br()
  }

  return(df)
}
