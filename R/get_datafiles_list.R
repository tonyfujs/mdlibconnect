#' get_datafiles_list
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

#TODO: Need to follow up with Mehmood regarding Numeric ID, and response
get_datafiles_list <- function(id, token){

  ###DOESN't WORK YET
  path <- paste0('api/catalog/', id, '/data_files')
  out <- connect_mdlib(path = path, token = token)

  #TODO: NEED TO FIX
  out <- out$content$`codeBook/fileDscr`

  return(out)
}
