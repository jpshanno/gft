#' List your Fusion Table IDs and Names
#'
#' @param token
#'
#' @return
#' @export
#'
#' @examples
gft_list <-
  function(token = NULL){

    if(is.null(token)){
      token <-
        gft_get_token()
    }

    url <- paste0("https://www.googleapis.com/fusiontables/v2/query?sql=SHOW+TABLES")

    server_response <- httr::content(httr::GET(url,
                                               httr::config(token = token)),
                                     as = "parsed",
                                     simplifyVector = TRUE,
                                     flatten = FALSE)

    tables <-
      data.frame(table_id = server_response[["rows"]][,1],
                 name = server_response[["rows"]][,2],
                 stringsAsFactors = FALSE)

    return(tables)
  }
