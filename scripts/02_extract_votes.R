library(XML)
library(xml2)
library(httr)
library(tidyverse)
library(data.table)


url <- "http://www.europarl.europa.eu/RegData/seance_pleniere/proces_verbal/2018/07-05/liste_presence/P8_PV(2018)07-05(RCV)_XC.xml"
# Parse the XML file
xmlfile <- read_xml(url, 
                    encoding = "UTF-8")

l_meps <- xml_find_all(xmlfile, ".//*[name()='PoliticalGroup.Member.Name']")
l_meps

extract_mep_name_and_attr <- function(list_meps){

}

dat <- lapply(l_meps, extract_mep_name_and_attr) %>% 
  rbindlist()


