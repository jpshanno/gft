#' Authorize gft to access your Fusion Tables
#'
#' @param cache One of logical or character. See \link[httr]{oauth2.0_token} for
#' more details
#'
#' @return
#' @export
#'
#' @examples
gft_auth <-
  function(cache = TRUE){
    gft_endpoints <-
      httr::oauth_endpoint(request = NULL,
                           authorize = "https://accounts.google.com/o/oauth2/auth",
                           access = "https://www.googleapis.com/oauth2/v3/token",
                           validate = "https://www.googleapis.com/oauth2/v1/tokeninfo",
                           revoke = "https://accounts.google.com/o/oauth2/revoke")
    gft_app <-
      httr::oauth_app("gft",
                      key = "164658514984-n76dncb6hqi3tktn3h5tqud82ug3dh89.apps.googleusercontent.com",
                      secret = "4vez94KVzP102M0M7akCdfn4",
                      redirect_uri = "urn:ietf:wg:oauth:2.0:oob")

    gft_token <-
      httr::oauth2.0_token(gft_endpoints,
                           gft_app,
                           scope = "https://www.googleapis.com/auth/fusiontables",
                           use_oob = TRUE,
                           cache = cache)
  }

