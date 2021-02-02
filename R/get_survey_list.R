#' get_survey_list
#'
#' @param token character
#'
#' @return list
#' @export
#'

get_survey_list <- function(token){

  n_records <- get_number_of_surveys(token)
  path <- paste0('index.php/api/catalog/search?ps=', n_records)
  out <- connect_mdlib(path = path, token = token)
  out <- out$content$result$rows

  return(out)
}

get_number_of_surveys <- function(token) {
  # Should be better integrated with the other functions (URL should not be hard coded)
  url <- "https://microdatalib.worldbank.org/index.php/api/catalog/search?ps=1"

  resp <- httr::GET(url,
                    httr::add_headers(.headers = c('X-API-KEY' = token,
                                                   'charset' = "utf-8")),
                    httr::accept_json())

  # Return useful message on error
  httr::stop_for_status(resp, task = 'complete request to Microdata library API\n')
  # CHECK: datatype is .JSON
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  # Parse response
  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)
  n_records <- parsed$result$total

  return(n_records)
}
