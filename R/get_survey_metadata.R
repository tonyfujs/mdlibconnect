#' get_survey_metadata
#'
#' @param id numeric: Survey Unique ID
#' @param token character
#'
#' @return list
#' @export
#'

get_survey_metadata <- function(id, token){
  path <- paste0('index.php/api/v2/metadata/study_dscr/', id)
  out <- connect_mdlib(path = path, token = token)
  out <- out$content

  return(out)
}
