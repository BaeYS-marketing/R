library(rvest)

url = "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
text = read_html(url, encoding = "utf-8")
nodes = html_nodes(text, "label.lbl_sfilter")

tech_Name = html_text(nodes, trim = T)
tech_Name = tech_Name[-length(tech_Name)]

tech_Name = gsub("[삭제]","",tech_Name)
tech_Name = gsub("[다른 필터항목 보기]","",tech_Name)
tech_Name = gsub("[\r\n]","",tech_Name)
tech_Name = gsub("[#]","",tech_Name)
tech_Name2 = gsub("[[:punct:]][1-9][[:punct:]]","",tech_Name)

info_count = gsub("[^[:digit:]]","",tech_Name)

page = data.frame(tech_Name2, info_count)
write.csv(page, "c:/Rstudy/saramin.csv")

View(page)