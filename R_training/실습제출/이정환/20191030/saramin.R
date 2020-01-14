url = "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
text = read_html(url)
ps = htmlParse(text)

tech_name = xpathSApply(ps, 
                        "//*[@id='async_sfilter']//span[@class='txt']",
                        xmlValue)
tech_name = gsub("#", "", tech_name)
tech_name = tech_name[-length(tech_name)]
tech_name

info_count = xpathSApply(ps,
                         "//*[@id='async_sfilter']//span[@class='count']",
                         xmlValue)
info_count = gsub("[[:punct:]]", "", info_count)
info_count

saramin = data.frame(tech_name, info_count)

write.csv(saramin, "saramin.csv", row.names = F)
