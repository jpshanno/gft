#' Update a Fusion Table column's properties
#'
#' @param table.id The Fusion Table ID containing the column you want to update
#' @param column The column name to update
#' @param updates The updates as a named list of properites to update (kind,
#'   columnId, name, type). See
#'   https://developers.google.com/fusiontables/docs/v2/using#CreatingColumn for
#'   more information on column information
#' @param ... Named arguments specifying path and file to direct
#'   \link{gft_get_token} to the cached OAuth token or a token object
#'
#' @export
#'
gft_update_col <-
  function(table.id,
           column,
           updates,
           ...){

    stopifnot(length(column) == 1)
    stopifnot(class(updates) == "list")

    token <- gft_get_token(...)

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
