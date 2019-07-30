#' get_doc_metadata
#'
#' @param id numeric: Survey Unique ID
#' @param datafile_id character: Data file Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_doc_metadata <- function(id, datafile_id, token){
  path  <- paste0('index.php/api/catalog/', id, '/data_files/', datafile_id, '?id_format=id&format=json')
  out   <- connect_mdlib(path = path, token = token)
  out   <- out$content$datafile

  return(out)
}
