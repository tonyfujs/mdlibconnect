#' get_datafiles_list
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_datafiles_list <- function(id, token){
  path <- paste0('index.php/api/v2/metadata/list_data_files/', id)
  out <- connect_mdlib(path = path, token = token)
  out <- out$content$`codeBook/fileDscr`

  return(out)
}
