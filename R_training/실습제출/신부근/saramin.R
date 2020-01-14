site="http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
url<-read_html(site)
tech_name<-html_text(html_nodes(url,'label > span.txt'))
info_count<-html_text(html_nodes(url,'label > span.count'))
tech_name<-gsub("#","",tech_name)
tech_name<-gsub("다른 필터항목 보기","",tech_name)
tech_name<-tech_name[nchar(tech_name)>0]
info_count<-gsub("\\(","",info_count)
info_count<-gsub("\\)","",info_count)
info_count<-as.numeric(info_count)
data<-data.frame(tech_name,info_count)
write.csv(data,"saramin.csv")
