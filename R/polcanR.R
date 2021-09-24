

# Loading data
url <- paste0("https://warin.ca/datalake/polcanR/canadianElectionTweets.csv")
path <- file.path(tempdir(), "temp.csv")
if (httr::http_error(url)) { # network is down = message (not an error anymore)
  message("No Internet connection or the server is in maintenance mode.")
  return(NULL)
} else { # network is up = proceed to download via curl
  message("polcanR: downloading remote dataset.")
  with(options(timeout = max(300, getOption("timeout"))),curl::curl_download(url, path))
} # /if - network up or down

# Reading data
csv_file <- file.path(paste0(tempdir(), "/temp.csv"))
polcan_data <- read.csv(csv_file)

# put date into character format
polcan_data$date <- as.character(polcan_data$date)

# Creating the default values for the function query
# IF an entry is missing, all the observations of this variable will be displayed
polcan_date <- base::unique(polcan_data$date)
polcan_language <- base::unique(polcan_data$language)


# Function 1: Data collection

#' polcanr_data
#'
#' @description This function allows you to retrieve tweets of the canadian election 2021 according to the selected parameters.
#' If no arguments are filled, all tweets will be displayed.
#'
#' @param dates Dates from 2021-08-15 to 2021-09-20
#' @param languages Language of tweets "fr" = french, "en" = english
#'
#' @import dplyr
#' @import lubridate
#'
#' @return Tweets for the dates and languages requested
#' @export
#'
#' @examples
#' all_tweets <- polcanr_data()
#' en_tweets <- polcanr_data(languages = "en")
#' fr_tweets <- polcanr_data(languages = "fr")
#' tweets_19sept <- polcanr_data(dates = "2021-09-19")
#' en_tweets_19sept <- polcanr_data(dates = "2021-09-19", languages = "en")

polcanr_data <- function(dates = polcan_date,
                         languages = polcan_language) {
  date <- language <- NULL
  out <- dplyr::filter(polcan_data,
                       date %in% dates,
                       language %in% languages)
  ## put date column as Date format
  out$date <- lubridate::ymd(out$date)
  return(out)
}



