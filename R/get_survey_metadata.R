#' get_survey_metadata
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_survey_metadata <- function(id, token){
  path <- paste0('index.php/api/catalog/find_by_id/', id)
  # out <- connect_mdlib(path = path, token = token)
  #TODO: REVERT BACK TO ABOVE
  out <- connect_mdlib(path = path, token = token, root = "http://microdata.worldbank.org")
  out <- out$content$dataset$metadata

  return(out)
}
