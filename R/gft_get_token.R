#' Fetch/Refresh a cached OAuth Token
#'
#' @param path
#' @param file
#'
#' @return
#' @export
#'
#' @examples
gft_get_token <-
  function(path = ".",
           file = ".httr-oauth"){

    token_file <-
      file.path(path,
                file)

    if(!file.exists(token_file)){
      stop("The token file specified ",
           token_file,
           " does not exist")
    }

    cached_tokens <-
      readRDS(token_file)

    gft_token <-
      cached_tokens[
      sapply(cached_tokens,
             function(x){x[["app"]][["key"]] == "164658514984-n76dncb6hqi3tktn3h5tqud82ug3dh89.apps.googleusercontent.com"})]

    if(length(gft_token) > 1){
      stop("More than one token generated via gft_auth() was found in the token file.")
    }

    if(length(gft_token) == 0){
      stop("No oauth token for gft was found in the token file, run gft_auth().")
    }

    gft_token <-
      gft_token[[1]]

    if(!gft_token$validate()){
      gft_token$refresh(cache = token_file)
    }

    return(gft_token)
  }
