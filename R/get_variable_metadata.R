#' get_variable_metadata
#'
#' @param id numeric: Survey Unique ID
#' @param variable_id character: Variable Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_variable_metadata <- function(id, variable_id, token){
  #TODO: NEED TO CONFIRM WITH MEHMOOD. Currently the API returns
  # Doesn't accept numeric id
  path  <- paste0('index.php/api/catalog/', id, '/variable/', variable_id)
  out   <- connect_mdlib(path = path, token = token)
  out   <- out$content$variable

  return(out)
}
