#' get_access_type
#'
#' @param token character
#'
#' @return list
#' @export
#'

get_access_types <- function(token){
  out <- connect_mdlib(path = 'index.php/api/catalog/data_access_codes', token = token)
  out <- out$content$codes

  return(out)
}
