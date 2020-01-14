#사람인 실습 CSS
library(rvest)
url="http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST" #브라우저의 기능  R에서도 가능
text=read_html(url)
text

nodes<-html_nodes(text, "label > span.txt")
code_name<- html_text(nodes)
code_name=gsub("#","",code_name)


nodes<- html_nodes(text,"label > span.count")
info_count<-html_text(nodes, trim=T)
info_count=gsub("[//(//)]","",info_count)
info_count=c(info_count,'0')

page<-data.frame(code_name,info_count)

write.csv(page,"saramin.csv")

getwd()

#사람인 실습 xpath
library(XML)
imsi=read_html("http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST")#xml은 서버 파싱 불가
t=htmlParse(imsi)

code_name=xpathSApply(t,"//span[@class='txt']",xmlValue);
code_name=gsub("#","",code_name)
code_name=code_name[2:32]

info_count=xpathSApply(t,"//span[@class='count']",xmlValue);
info_count=gsub("[//(//)]","",info_count)
info_count=gsub("...건","",info_count)
info_count=info_count[3:32]
info_count=c(info_count,'0')

page<-data.frame(code_name,info_count)

write.csv(page,"saramin2.csv")
