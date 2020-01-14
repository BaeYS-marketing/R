library(rvest)


#css selector
site = 'http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST'

#html 불러와서 읽기 
text<-read_html(site)

#파싱된 태그 타겟팅 + 전처리
nameNodes<- html_nodes(text,'li>label>span.txt')
tech_name<-html_text(nameNodes)
length(tech_name)
tech_name<-tech_name[-31]
tech_name<-gsub('#','',tech_name)

valueNodes<- html_nodes(text,'li>label>span.count')
info_count<-html_text(valueNodes)
length(info_count)
info_count<-gsub('[[:punct:]]','',info_count)

#데이터 저장 
Sdata<- data.frame(tech_name,info_count)
View(Sdata)

write.csv(Sdata,'saramin.csv')




#xpath
library(XML)
site = 'http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST'

text<-read_html(site)

#불러온html 컨텐츠 >  XML맞춤 파싱 : htmlParse
x.text <- htmlParse(text)

#파싱 태그 타겟팅 
name <- xpathSApply((x.text), '//li/label/span[@class ="txt"]',xmlValue)
count <- xpathSApply((x.text), '//li/label/span[@class = "count"]',xmlValue)

#규격맞추기 + 문자 전처리 _ 정규식표현 사용
name<-name[-length(name)]
name<-gsub('#','',name)
count<-gsub('[[:punct:]]','',count)

#데이터 저장
S2data <- data.frame(name,count)

View(S2data)

write.csv(S2data,'saramin.csv')






