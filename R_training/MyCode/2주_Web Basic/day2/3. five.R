naver.url <-  "https://movie.naver.com/movie/point/af/list.nhn?page=1"
url<-read_html(naver.url)



#콘텐츠 추출 순서
'1. URL setting
 2. read_html
 3. html_node
 4. html_text'



#
'1.크롤링하고자 하는 웹사이트의 문자열을 파악해야 한다(쿼리 문자열 포함)
주소창 확인
2. 웹페이지의 컨텐트가 어떤 문자셋으로 작성되었는지 파악
<meta>
3.추출하려는 컨텐츠를 포함하고 있는 태그를 찾는다
개발자도구의 기능을 활용한다
4.찾은태그의 CSS Selector,또는 Xpath를 판단한다
5. Rvest라는 패키지를 사용한다.'






c1 <- html_nodes(url,"#old_content > table > tbody > tr:nth-child(8) > td.title > a.movie")
c1

c2 <-html_nodes(url,"#old_content > table > tbody > tr> td.title > a.movie")
c2
#html_node는 제일 위 하나만 추출

html_text(c1)           
html_text(c2)

?html_text





#
naver.url <-  "https://movie.naver.com/movie/point/af/list.nhn"
url <- read_html(naver.url, encoding = 'CP949')
url


#영화제목
nodes <- html_nodes(url, '.movie')
title <- html_text(nodes)
title

#영화리뷰
nodes <- html_nodes(url, '.title')
review <- html_text(nodes, trim=TRUE)


review <- gsub('\t','',review)
review <- gsub('[\r\n]','',review)
review <- gsub('신고','',review)
review
page <- data.frame(title,review)
write.csv(page,'movie_reviews1.csv')




#여러 페이지
site <-  "https://movie.naver.com/movie/point/af/list.nhn?page="
movie.review <-NULL
for(i in 1:100){
        url <- paste(site,i,sep='')
        text <- read_html(url,encoding ='CP949')
        
        nodes <- html_nodes(text,'.title')
        review <- html_text(nodes, trim=TRUE)
        
        
        review <- gsub('\t','',review)
        review <- gsub('[\r\n]','',review)
        review <- gsub('신고','',review)
        page <- data.frame(title,review)
        movie.review <- rbind(movie.review,page)
        
}
write.csv(movie.review,'movie_reviews2.csv')
getwd()
