#' get_variables_by_study
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_variables_by_study <- function(id, token){
  #TODO: NEED TO CONFIRM WITH MEHMOOD. Currently the API returns
  # Doesn't accept numeric id
  path <- paste0('index.php/api/catalog/', id, '/variables')
  out <- connect_mdlib(path = path, token = token)
  out <- out$content$variables

  return(out)
}
