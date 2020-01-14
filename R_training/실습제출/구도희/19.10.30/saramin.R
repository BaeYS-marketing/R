install.packages("httr")
install.packages("rvest")
library(httr)
library(rvest)
saramin <- read_html("http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST")
tech <- html_nodes(saramin,"#async_sfilter li span.txt" )
tech_name <- html_text(tech)
tech_name <- gsub("#","",tech_name)
tech_name <- gsub("다른 필터항목 보기","",tech_name)
tech_name <- tech_name[nchar(tech_name)>0]
tech_name
info <- html_nodes(saramin, "#async_sfilter li span.count")
info_count <- html_text(info)
info_count <- gsub("[()]","",info_count)
info_count 
sm <- data.frame(tech_name,info_count)
write.csv(sm, "saramin.csv")

# 기술이름(tech_name)
# 채용 정보 건수(info_count) 
# CSV 파일(파일명:saramin.csv)
# tech_name <- tech_name[nchar(tech_name)>0] 주의!
