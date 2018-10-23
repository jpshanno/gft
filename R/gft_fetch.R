#' Return a tibble representing a Fusion Table
#'
#' Run a SQL query on a fusion table and return the results as a dataframe
#'
#' @param table.id A Fusion Table ID specifying which table to retreive data from
#' @param query A query to run on the selected table
#' @param ... Named arguments specifying path and file to direct
#'   \link{gt_get_token} to the cached OAuth token or a token object
#'
#' @return A dataframe of the query results
#' @export
#'
#' @examples
gft_fetch <-
  function(table.id = NULL,
           query = NULL,
           ...){
    if(is.null(table.id) || !is.character(table.id)){
      stop("table.id must be NULL or a character vector representing a fusion table ID. Run gft_tables() to find table IDs")}
    if(!is.null(table.id) && !is.null(query)){
      stop("Only supply one of table.id or query")}

    token <- gft_get_token(...)

    base_url <-
      "https://www.googleapis.com/fusiontables/v2/query?sql="

    if(!is.null(table.id)){
      sql_string <- paste0("SELECT * FROM ", table.id)
    } else {
      sql_string <- query
    }


    url <-
      httr::build_url(httr::parse_url(paste0(base_url,
                                             sql_string,
                                             "&alt=csv")))


    response <-
      httr::GET(url,
                httr::config(token = token))

    if(httr::status_code(response) == 200){
      query_content <-
        httr::content(response,
                      type = "text/csv",
                      encoding = "UTF-8")
      return(query_content)
    } else {
      stop("Something went wrong and the table could not be fetched.")
    }
  }
