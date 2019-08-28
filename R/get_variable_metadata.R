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
  path  <- paste0('index.php/api/catalog/', id, '/variable/', variable_id, '?id_format=id&format=json')
  out   <- connect_mdlib(path = path, token = token)
  out   <- out$content$variable

  return(out)
}
