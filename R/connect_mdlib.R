#' connect_mdlib
#'
#' @param path character: path to send request
#' @param query character
#' @param token character: access token to be opbtained from \url{http://microdatalibqa.worldbank.org/apidocumentation/}
#'
#' @return object of class mdlib_api
#' @export
#'

connect_mdlib <- function(path, query = NULL, token) {
  # Build request URL
  url <- httr::modify_url("http://microdatalibqa.worldbank.org", path = path, query = query)
  # Send request to API
  resp <- httr::GET(url,
            httr::add_headers(.headers = c('X-API-KEY' = token)),
            httr::accept_json(),
            httr::progress())
  # Return useful message on error
    httr::stop_for_status(resp, task = 'complete request to Microdata library API\n')
  # CHECK: datatype is .JSON
  if (http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  # Parse response
  parsed <- jsonlite::fromJSON(content(resp, "text"), simplifyVector = TRUE)

  # Organize information
  out <- structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),

    class = "mdlib_api"
  )

  return(out)
}


print.mdlib_api <- function(x, ...) {
  cat("<http://microdatalibqa.worldbank.org/", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
