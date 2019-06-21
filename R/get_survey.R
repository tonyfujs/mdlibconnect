#' get_survey
#'
#' @param id numeric:Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_survey <- function(id, token){
  path <- paste0('index.php/api/catalog/find_by_id/', id)
  out <- connect_mdlib(path = path, token = token)
  out <- out$content$dataset

  include <- c("id","repositoryid", "idno",
               "title", "nation","year_start",
               "year_end","data_access_type", "created",
               "changed")

  out     <- out[names(out) %in% include]

  return(out)
}
