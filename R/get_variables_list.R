#' get_variables_list
#'
#' @param id numeric: Survey Unique ID
#' @param datafile_id character: Data file Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_variables_list <- function(id, datafile_id, token){
  path <- paste0('index.php/api/v2/metadata/datafile_variables/', id, '/', datafile_id)
  out <- connect_mdlib(path = path, token = token)
  out <- out$content$items

  return(out)
}
