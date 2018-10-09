#' Create a new Fusion Table from an R Object
#'
#' @param x
#' @param name
#'
#' @return
#' @export
#'
#' @examples
gft_create <-
  function(x, name){
    if(is.character(quote(x))){
      table.file <- x
    } else {
      if(exists(deparse(substitute(x)))){
        table.file <- tempfile()
        utils::write.csv(x,
                         table.file,
                         row.names = FALSE)
      }
    }

    if(is.null(token)){
      token <- gft_get_token()
    }

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
