
site <- read_html('http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=&searchType=default_mysearch&searchword=DATA%20SCIENTIST')

k <- htmlParse(site)

cntt_ttl <- xpathSApply(k, "//span[@class='txt']", xmlValue)
cntt_ttl 
cntt_num <- xpathSApply(k, "//span[@class='count']", xmlValue) 
cntt_num

cntt_num <- gsub("[^[:digit:]]", "", cntt_num)
cntt_ttl <- gsub("[[:punct:][:cntrl:]]", "", cntt_ttl)

cntt_num <- cntt_num[3:32]
cntt_num <- as.numeric(cntt_num)

cntt_ttl <- cntt_ttl[2:31]
  
content_f <- data.frame(tech_name =  cntt_ttl,info_count = cntt_num)
write.csv(content_f, "saramin.csv")
