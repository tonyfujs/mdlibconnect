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
  path  <- paste0('index.php/api/catalog/', id, '/data_files/', datafile_id, '/variables?id_format=id&format=json')
  out   <- connect_mdlib(path = path, token = token)
  out   <- out$content$variables

  return(out)
}
