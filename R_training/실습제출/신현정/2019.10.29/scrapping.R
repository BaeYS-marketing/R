url<- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"

text <-read_html(url)
text

#<h1> 태그의 컨텐츠
html_text(html_nodes(text, "h1"))
# <a> 태그의 컨텐츠
html_text(html_nodes(text, "a"))
# <a> 태그의 href 속성값
html_attr(html_nodes(text, "a"), "href")
# <img> 태그의 src 속성값
html_attr(html_nodes(text, "img"), "src")
# 첫 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(1)"))
# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(text, "ul > [style$=green]"))
#두 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(2)"))
#<ol> 태그의 모든 자식 태그들의 컨텐츠 
html_text(html_nodes(text, "ol > *"))
#<table> 태그의 모든 자손 태그들의 컨텐츠 
html_text(html_nodes(text, "table *"))
#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(text, "tr[class=name]"))
#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(text, "td#target"))



 review <-gsub("\t","",review)
review <-gsub("\r\n","",review)
 review <-gsub("\n","",review)
review <-gsub("신고","",review)
 
   page<-data.frame(title,review)
 write.csv(page,"movie_reviews.csv")> nodes <-html_nodes(text, ".title")
 review <-html_text(nodes, trim=TRUE)
#영화리뷰
nodes <-html_nodes(text, ".title")
 review <-html_text(nodes, trim=TRUE)
 review



#여러 페이지
 site <-"http://movie.naver.com/movie/point/af/list.nhn?page="
 movie.review <-NULL
 for(i in 1:100){
     url <-paste(site, i, sep="")
     text <- read_html(url, encoding="CP949")
     nodes<- html_nodes(text,".movie")
    title <-html_text(nodes)
     nodes <- html_nodes(text,".title")
    review <-html_text(nodes,trim=TRUE)
   review <-gsub("\t","",review)
     review <-gsub("[\r\n]","",review)
     review <-gsub("신고","",review)
page <-data.frame(title,review)
     movie.review <-rbind(movie.review, page)}
 write.csv(movie.review, "movie_reviews2.csv")
