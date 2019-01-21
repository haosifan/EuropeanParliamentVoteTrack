library(rvest)

url <- "http://www.europarl.europa.eu/RegistreWeb/search/simple.htm?codeTypeDocu=PPVD&lg=DE&currentPage=1"

links <- read_html(url) %>% 
  html_nodes("[class=\"results\"]") %>% 
  html_nodes("a") %>%
  html_attr("href")



#read_html(url) %>% 
#  html_nodes(xpath = "//*[contains(concat( \" \", @class, \" \" ), concat( \" \", \"reference\", \" \" ))]")
