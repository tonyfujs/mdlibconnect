#' get_survey
#'
#' @param id numeric:Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_survey <- function(id, token){
  path <- paste0('index.php/api/v2/catalog/find_by_id/', id)
  out <- connect_mdlib(path = path, token = token)
  out <- out$content$item

  return(out)
}
