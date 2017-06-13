#' get_public_survey_list
#'
#' @param token character
#'
#' @return list
#' @export
#'

get_public_survey_list <- function(token){
  out <- connect_mdlib(path = 'index.php/api/v2/catalog/list',
                       token = token,
                       root = 'http://microdata.worldbank.org/index.php/api/v2/catalog/list')
  out <- out$content$studies

  return(out)
}
