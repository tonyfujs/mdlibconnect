#' connect_mdlib
#'
#' @param path character: path to send request
#' @param query character
#' @param token character: access token to be obtained from \url{https://microdatalib.worldbank.org/index.php/auth/api_keys}
#' @param root character: the root url that hosts the API
#'
#' @return object of class mdlib_api
#' @export
#' @importFrom utils str
#'

connect_mdlib <- function(path, query = NULL, token, root = "https://microdatalib.worldbank.org") {
  # Build request URL
  url <- httr::modify_url(root, path = path, query = query)
  # Send request to API
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
  cat("<https://microdatalibqa.worldbank.org/", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
