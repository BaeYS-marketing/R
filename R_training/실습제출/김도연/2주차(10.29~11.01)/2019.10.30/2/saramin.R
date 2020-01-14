install.packages("rvest")

library(rvest)
url = "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
text = read_html(url, encoding = "UTF-8")
text

nodes = html_nodes(text, ".lbl_sfilter > .txt")
tech_name = html_text(nodes[1:30])
tech_name
tech_name = gsub("#","",tech_name)
tech_name

info_count = html_text(html_nodes(text, ".lbl_sfilter > .count"))
info_count
info_count = gsub("[()]","",info_count)
info_count
page = data.frame(tech_name, info_count)

write.csv(page, "saramin.csv")
