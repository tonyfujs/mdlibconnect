#' get_survey_list
#'
#' @param token character
#'
#' @return list
#' @export
#'

get_survey_list <- function(token){
  out <- connect_mdlib(path = 'index.php/api/catalog/search?ps=10000', token = token)
  out <- out$content$result$rows

  return(out)
}
