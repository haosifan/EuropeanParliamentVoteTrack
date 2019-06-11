library(rvest)
library(purrr)

url <- "https://www.europarl.europa.eu/RegistreWeb/search/simple.htm?codeTypeDocu=PPVD&lg=DE&currentPage=1"

temp_url <- url
history <- NULL

for(i in 1:300) {
  history[i] <- temp_url
  try(
    temp_url <- html_session(temp_url) %>% 
      follow_link("Next") %>% .$url
  )
}

history <- unique(history)



links <- read_html(url) %>% 
  html_nodes("[class=\"results\"]") %>% 
  html_nodes("a") %>%
  html_attr("href")

