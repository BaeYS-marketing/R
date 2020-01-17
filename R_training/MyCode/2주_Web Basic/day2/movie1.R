#1페이지
library(rvest)

site <- 'https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen&page=1'
text <-read_html(site, encoding="UTF-8")
text

nodes <- html_nodes(text,'.desc_review')
nodes

review <- html_text(nodes, trim = TRUE)
review


nodes2 <- html_nodes(text,'.emph_grade')
grade <- html_text(nodes2)
grade


page1<-data.frame(grade,review)
View(page1)

write.csv(page1,'daummovie1.csv')



#10페이지 불러오기

url_base <- 'https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen&page='

movie_review<-NULL

for(i in 1:10){
        url <- paste0(url_base, i)
        html <- read_html(url, endcoding = 'UTF-8')
        
        nodes <- html_nodes(html,'.emph_grade')
        grade <- html_text(nodes)
        
        nodes2<- html_nodes(html,'.desc_review')
        review<- html_text(nodes2)
        
        page <- data.frame(grade, review)
        movie_review <- rbind(movie_review, page)
}
write.csv(movie_review,'daummovie2.csv')
getwd()
