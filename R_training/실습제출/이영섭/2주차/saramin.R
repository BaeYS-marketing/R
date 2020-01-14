
# css로 크롤링
library(rvest)
library(dplyr)
url <- "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"

tech_name <- url %>% read_html(encoding = "UTF-8") %>% html_nodes("#async_sfilter  label > span.txt") %>% html_text()
tech_name <- tech_name[-length(tech_name)]
tech_name <- gsub("#","",tech_name)

info_count <- url %>% read_html(encoding = "UTF-8") %>% html_nodes("#async_sfilter  label > span.count") %>% html_text()
info_count <- gsub("\\(","",info_count)
info_count <- gsub("\\)","",info_count)

data <- data.frame(tech_name,info_count)

write.csv(data,"saramin.csv")



# XML로 크롤링
library(XML)
test1 <- read_html("http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST", encoding = "UTF-8")
t <- htmlParse(test1)
tech_name_1 <- xpathSApply(t,'//*[@id="async_sfilter"]/div/div[2]/div[2]/ul/li/label/span[1]', xmlValue)
tech_name_1 <- tech_name_1[-length(tech_name)]
tech_name_1 <- gsub("#","",tech_name_1)

info_count_1 <- xpathSApply(t,'//*[@id="async_sfilter"]/div/div[2]/div[2]/ul/li/label/span[2]', xmlValue)
info_count_1 <- gsub("\\(","",info_count_1)
info_count_1 <- gsub("\\)","",info_count_1)

data_1 <- data.frame(tech_name_1,info_count_1)
