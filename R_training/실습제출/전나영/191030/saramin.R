##### CSS Selector #####
site <- "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
text <- read_html(site, encoding = "UTF-8")

# 기술이름
# nodes <- html_nodes(text, ".lbl_sfilter > .txt")
nodes <- html_nodes(text, "li > label > span.txt")
tech_name <- html_text(nodes[1:30])
tech_name <- gsub("#", "", tech_name)

# 채용 정보 건수
nodes <- html_nodes(text, ".lbl_sfilter > .count")
info_count <- html_text(nodes)
info_count <- gsub("[()]", "", info_count)

page <- data.frame(tech_name, info_count)

write.csv(page, "saramin.csv")


##### Xpath #####
library(XML)

imsi <- read_html("http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST")
t <- htmlParse(imsi)

# 기술이름
tech_name <- xpathSApply(t, "//span[@class='txt']", xmlValue)
tech_name <- tech_name[2:31]
tech_name <- gsub("#", "", tech_name)

# 채용 정보 건수
info_count <- xpathSApply(t, "//span[@class='count']", xmlValue)
info_count <- info_count[3:32]
info_count <- gsub("[()]", "", info_count)

page <- data.frame(tech_name, info_count)

write.csv(page, "saramin2.csv")