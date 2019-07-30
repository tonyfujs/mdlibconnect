#' get_datafiles_list
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_datafiles_list <- function(id, token){
  path  <- paste0('index.php/api/catalog/', id, '/data_files?id_format=id&format=json')
  out   <- connect_mdlib(path = path, token = token)
  out   <- out$content$datafiles

  return(out)
}
