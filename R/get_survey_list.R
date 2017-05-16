#' get_survey_list
#'
#' @param token character
#'
#' @return list
#' @export
#'

get_survey_list <- function(token){
  out <- connect_mdlib(path = 'index.php/api/v2/catalog/list', token = token)
  out <- out$content$studies

  return(out)
}
