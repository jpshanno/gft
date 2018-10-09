#' Update a Fusion Table column's properties
#'
#' @param table.id
#' @param column
#' @param updates
#' @param token
#'
#' @return
#' @export
#'
#' @examples
gft_update_col <-
  function(table.id,
           column,
           updates,
           token = NULL){

    stopifnot(length(column) == 1)
    stopifnot(class(updates) == "list")

    if(is.null(token)){
      token <- gft_get_token()
    }

    url <-
      paste0("https://www.googleapis.com/fusiontables/v2/tables/",
             table.id,
             "/columns/",
             column)

    response <-
      httr::GET(url,
                httr::config(token = token))

    column <-
      httr::content(response)

    column[names(updates)] <- updates

    httr::PUT(url,
              httr::add_headers(`Content-type` = "application/json"),
              httr::config(token = token),
              body = jsonlite::toJSON(column,
                                      auto_unbox = TRUE),
              httr::verbose())
  }
