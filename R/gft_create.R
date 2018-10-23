#' Create a new Fusion Table from an R Object
#'
#' @param x An R object to be written to Google Fusion Table
#' @param name A string representing the name of the new fusion table
#' @param ... Named arguements specifying path and file to direct
#'   \link{gt_get_token} to the cached OAuth token
#'
#' @return
#' @export
#'
#' @examples
gft_create <-
  function(x,
           name,
           ...){

    if(is.character(quote(x))){
      table.file <- x
    } else {
      if(exists(deparse(substitute(x)))){
        table.file <- tempfile(fileext = ".csv")
        if(any(grepl("^sf$", class(x)))){
          x <- sf_to_kml(x)
        }
        utils::write.csv(x,
                           file = table.file,
                           row.names = FALSE)
      } else {
        stop(x, "does not exist in the current environment.")
      }
    }

    token <-
      gft_get_token(...)

    # Add name check here for existing table

    url <-
      paste0("https://www.googleapis.com/upload/fusiontables/v2/tables/import?uploadType=media&name=",
             as.character(name))

    response <-
      httr::POST(url = url,
                 httr::add_headers(`Content-Type` = 'application/octet-stream'),
                 httr::config(token = token),
                 body = httr::upload_file(table.file))

    if(httr::status_code(response) == 200){
      table_id <-
        httr::content(response)$tableId
      return(table_id)
    } else {
      stop("Something went wrong and the table was not uploaded.")
    }
  }
