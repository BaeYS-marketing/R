url = "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
text = read_html(url)
nodes<-html_nodes(text, "label.lbl_sfilter")
all_name<-html_text(nodes, trim=T)
all_name<-gsub("\\s", "" ,all_name)
all_name<-gsub("삭제", "" ,all_name)
all_name<-gsub("[[:punct:]]", "" ,all_name)
all_name<-gsub("다른필터항목보기", "" ,all_name)
all_name<-all_name[nchar(all_name)>0]
tech_name<-gsub("[0-9]", "" ,all_name) 
tech_name
info_count<-gsub("[^[:digit:]]", "" ,all_name)
info_count
saramin<-data.frame(tech_name,info_count)
write.csv(saramin, "data/saramin.csv")