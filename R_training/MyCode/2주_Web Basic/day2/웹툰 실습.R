
library(rvest)
site <- 'https://comic.naver.com/genre/bestChallenge.nhn'



#comicName
url<-read_html(site, encoding = 'UTF-8')

#n.nodes<-html_nodes(url,'#content > div > table > tbody > tr > td > div.challengeInfo > h6 > a')
# -> 동적으로 만들어진 무엇인가가 있다. 
# 정적으로 만들어진 페이지여서 css알려준 주소로 내려가면서 찾아갈 수 있었다.
#근데 네이버는 중간이나 위에서 동적으로 만들어진 무엇인가가 있다. 그러면 못찾아
'응용력 발휘!!  h6라는 태그가 많이 쓰일까요??
그리고 h6의 자식태그도 있으니까.'

n.nodes <- html_nodes(url,'h6.challengeTitle')

comicName <- html_text(n.nodes, trim = T)
comicName




#comicSummary
url <-read_html(site)

#c.nodes<-html_nodes(url,'#content > div > table > tbody > tr > td > div.challengeInfo > div.summary')
c.nodes <- html_nodes(url, 'div.summary')

comicSummary<-html_text(c.nodes,trim = T)
comicSummary






#comicGrade

#g.nodes<-html_nodes(url,'#content > div > table > tbody > tr > td > div.challengeInfo > div.rating_type > strong')
g.nodes <- html_nodes(url,'strong')

g.nodes <- html_nodes(url, 'div.rating_type') 

#에러
g.nodes <- html_attrs(html_nodes(url,'em'), "title")

g.nodes


comicGrade <- html_text(g.nodes, trim = T)
comicGrade



#정답!!
g.nodes <- html_nodes(url, 'div.rating_type > strong') 
g.nodes

comicGrade <- html_text(g.nodes)
comicGrade



##



site <- 'https://comic.naver.com/genre/bestChallenge.nhn'
url<-read_html(site, encoding = 'UTF-8')
naverComic <- NULL

for (i in 1:116){
        #comicName
        n.nodes <- html_nodes(url,'h6.challengeTitle')
        comicName <- html_text(n.nodes, trim = T)
        
        #comicSummary
        c.nodes <- html_nodes(url, 'div.summary')
        comicSummary<-html_text(c.nodes,trim = T)
        
        #comicGrade
        g.nodes <- html_nodes(url, 'div.rating_type > strong')
        comicGrade <- html_text(g.nodes)
        
        frame <- data.frame(comicName,comicSummary,comicGrade)
        naverComic <- rbind(naverComic,frame)
}
write.csv(naverComic,'navercomic.csv')
