#' get_variables_by_study
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_variables_by_study <- function(id, token){
  path  <- paste0('index.php/api/catalog/', id, '/variables?id_format=id&format=json')
  out   <- connect_mdlib(path = path, token = token)
  out   <- out$content$variables

  return(out)
}
