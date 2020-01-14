
url <- "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
text <- read_html(url)
text

nodes <- html_nodes(text, "label > span.txt")
nodes
tech_name <- html_text(nodes)
tech_name

tech_name <- gsub("다른 필터항목 보기", "", tech_name)
tech_name <- gsub("#", "", tech_name)
tech_name <- tech_name[nchar(tech_name)>0]

nodes <- html_nodes(text, "span.count")
nodes
info_count <- html_text(nodes)
info_count
info_count <- gsub("[^0-9]", "", info_count)
nchar(info_count)
info_count <- info_count[nchar(info_count)>0]

page <- data.frame(tech_name, info_count)
write.csv(page, "c:/Rstudy/saramin.csv")
