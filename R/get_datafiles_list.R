#' get_datafiles_list
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_datafiles_list <- function(id, token){
  #TODO: NEED TO CONFIRM WITH MEHMOOD. Currently the API returns
  # all dataset metadata, and doesn't accept numeric id
  path <- paste0('index.php/api/catalog/', id, '/data_files')
  out <- connect_mdlib(path = path, token = token)
  out <- out$content$`codeBook/fileDscr`

  return(out)
}
