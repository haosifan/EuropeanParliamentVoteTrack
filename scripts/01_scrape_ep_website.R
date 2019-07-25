library(rvest)
library(plyr)
library(tidyverse)

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

pages_ep_website <- unique(history)
saveRDS(pages_ep_website, "temp_files/pages_ep_website.Rdata")

scrape_xml_links <- function(pages) {
  temp_xml_links<- read_html(pages) %>% 
    html_nodes("#mainzone a:nth-child(2)") %>% 
    html_attr("href")
  return(temp_xml_links)
}

xml_links <- plyr::ldply(pages_ep_website[1:10], .fun = scrape_xml_links, .progress = "text") %>% 
  unlist() %>% unname()


