#' get_access_type
#'
#' @param token character
#'
#' @return list
#' @export
#'

get_access_types <- function(token){
  out <- connect_mdlib(path = 'index.php/api/v2/catalog/list_data_access_types', token = token)
  out <- out$content$access_types

  return(out)

}
