library(rvest)

url <- "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
text <- read_html(url)
node1 <- html_nodes(text, "label > span.txt")
vec_node1 <- html_text(node1)
vec_node1 <- vec_node1[1:30]
node2 <- html_nodes(text, "label > span.count")
vec_node2 <- html_text(node2)
vec_node2 <- gsub("[[:punct:]]","",vec_node2)
result <- data.frame(tech_name = vec_node1, info_count = vec_node2)
write.csv(result, "saramin.csv")
