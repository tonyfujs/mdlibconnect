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
  #TODO: NEED TO CONFIRM WITH MEHMOOD. Currently the API returns
  # all dataset metadata, and doesn't accept numeric id
  path <- paste0('index.php/api/catalog/', id, '/data_files/', datafile_id)
  out <- connect_mdlib(path = path, token = token)
  out <- out$content

  return(out)
}
