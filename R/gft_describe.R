#' Return Description Information For Fusion Table
#'
#' @param table.id
#' @param token
#'
#' @return
#' @export
#'
#' @examples
gft_describe <-
  function(table.id,
           token = NULL){

    if(is.null(table.id) || !is.character(table.id)){
      stop("table.id must be NULL or a character vector representing a fusion table ID. Run gft_tables() to find table IDs")}

    if(is.null(token)){
      token <- gft_get_token()
    }

    url <- paste0("https://www.googleapis.com/fusiontables/v2/tables/", table.id)

    response <-
      httr::GET(url,
                httr::config(token = token))

    if(httr::status_code(response) == 200){
      table_info <-
        jsonlite::fromJSON(httr::content(response,
                                         type = "text",
                                         encoding = "UTF-8"))
      return(table_info)
    } else {
      stop("Something went wrong and the table was not uploaded.")
    }
  }
