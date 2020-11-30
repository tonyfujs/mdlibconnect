#' get_data_dictionary
#'
#' @param id numeric: Survey Unique ID
#' @param token character: Microdata API authentication token
#' @param limit character: maximum number of records per page
#'
#' @return list
#' @export
#'

get_data_dictionary <- function(id, token, limit = NULL){
  if (is.null(limit)) {
    path <- paste0('index.php/api/v2/metadata/list_variables/', id)
    out <- connect_mdlib(path = path, token = token)
    out <- out$content$items

    return(out)

  } else {
    out <- vector(mode = 'list', length = 1000)
    counter = 1

    records_number <- limit
    while (records_number == limit) {
      temp_offset <- (counter - 1) * limit
      path <- paste0('index.php/api/v2/metadata/list_variables/', id, '/', limit, '/', temp_offset)
      temp_out <- connect_mdlib(path = path, token = token)
      temp_out <- temp_out$content$items
      out[[counter]] <- temp_out
      counter <- counter + 1
      records_number <- length(temp_out)
    }

    out <- purrr::flatten(out)

    return(out)
  }
}
