#' List your Fusion Table IDs and Names
#'
#' Return a dataframe containing the your Fusion Table IDs and names.
#'
#' @param ... Named arguments specifying path and file to direct
#'   \link{gt_get_token} to the cached OAuth token or a token object
#'
#' @return A dataframe with two columns \code{ID} and \code{name}
#' @export
#'
#' @examples
gft_list <-
  function(...){

    token <-
      gft_get_token(...)

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
