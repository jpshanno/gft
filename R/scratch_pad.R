

# gft_auth





# gft_read <-
#   fuction(table.id,
#           table.name,
#           query
#   )









# gft_update

# update_gft?
# Test Reading a Table

# POST(url = paste0("https://www.googleapis.com/fusiontables/v2/query?access_token=",
#                   gft_token$credentials$access_token,
#                   "&sql=SELECT+%2A+FROM+1i8FjyKmQkq_yh9AidIPrvItxodG_Vc7PIov-Ft8B"))
#
# fromJSON(rawToChar(GET(url = paste0("https://www.googleapis.com/fusiontables/v2/query?access_token=",
#                                     gft_token$credentials$access_token,
#                                     "&sql=SHOW+TABLES"))$content))
#
# GET(url = "https://www.googleapis.com/fusiontables/v2/tables/1i8FjyKmQkq_yh9AidIPrvItxodG_Vc7PIov-Ft8B",
#     add_headers(Authorization = paste("Bearer", gft_token$credentials$access_token, sep = " "),
#                 Accept = "application/json"))
#
#
# # UPLOAD A TABLE
#
# test_table <-
#   read.csv("Resources/OAuth_Test_Table.csv",
#            stringsAsFactors = FALSE)
#
# uploaded_table <-
#
#
#
#
#
#
#
#   # UPLOAD A CSV TO A NEW TABLE
# uploaded_csv <-
#   httr::POST(url = "https://www.googleapis.com/upload/fusiontables/v2/tables/import?uploadType=media&name=testtable",
#              httr::add_headers('Content-Type' = "application/octet-stream",
#                                'Content-Length' = file.size("Resources/OAuth_Test_Table.csv")),
#              httr::config(token = readRDS(".httr-oauth")[[1]]),
#              body = httr::upload_file("Resources/OAuth_Test_Table.csv"),
#              httr::verbose())


# gft_append_table <-


# Working Zone - Leave Commented on Save ----------------------------------

#
# # Upload dataframe with KML formatted string to existing table with
# empty_table_id <- "1ltHjq_k8yKuMEatR-bScy77vKV05PcZuqsN7pHIJ"
# x <- stlouis_upload
# table.file <- tempfile(fileext = ".csv")
# write.table(x,
#             table.file,
#             sep = ",",
#             col.names = FALSE,
#             row.names = FALSE)
#
# import_url <-
#   paste0("https://www.googleapis.com/upload/fusiontables/v2/tables/",
#          empty_table_id,
#          "/import")
#
# httr::POST(url = import_url,
#            httr::add_headers(`Content-Type` = "application/octet-stream"),
#            httr::config(token = gft_get_token()),
#            body = httr::upload_file(table.file),
#            httr::verbose())
