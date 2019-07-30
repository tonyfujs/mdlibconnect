#' get_survey_metadata
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_survey_metadata <- function(id, token){
  path  <- paste0('index.php/api/catalog/', id, '?id_format=id&format=json')
  out   <- connect_mdlib(path = path, token = token)
  out   <- out$content$dataset$metadata

  return(out)
}
