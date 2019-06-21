#' get_doc_metadata
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

#TODO: NEED TO FOLLOWUP WITH MEHMOOD
get_doc_metadata <- function(id, token){
  path <- paste0('index.php/api/v2/metadata/doc_dscr/', id)
  out <- connect_mdlib(path = path, token = token)
  out <- out$content

  return(out)
}
