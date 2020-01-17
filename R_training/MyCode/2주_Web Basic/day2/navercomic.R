library(rvest)

#크롤링 

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




#마지막 페이지
#네이버 마지막 페이지 계쏙 돌아간다....


#방법 1 _ 다음페이지
Site <-"https://comic.naver.com/genre/bestChallenge.nhn?&page="
start <-1
numSite <- paste0(Site,start)
url<-read_html(numSite)

is.na(html_nodes(url,'#content > div.paginate > div > a.next > span.cnt_page'))
start <-1


while(!is.na(html_nodes(url,'#content > div.paginate > div > a.next > span.cnt_page'))){
        start<-start+1
        numSite <- paste0(Site,start)
        url<-read_html(numSite)
}

print(start)   #Error in while (!is.na(html_nodes(url, "#content > div.paginate > div > a.next > span.cnt_page"))) 
               #        { : argument is of length zero   > 태그 아규먼트가 없어서 에러.












#에러 잡기 


typeof(html_nodes(url,'#content > div.paginate > div > a.next > span.cnt_page'))

a<-list()
typeof(a)        #list
is.null(a)       #FALSE

a == TRUE  #logical(0) ~   logical(0)/NULL/ NA  빈집 / 집도 없음 / 집에 무엇인가가 없음
NA==TRUE     #NA
length(a)     #0





if(is.na(a)){
  print('na')
}else {
  print('not na')
}
#Error in if (is.na(a)) { : argument is of length zero


is.na(a)      #logical(0)
#First off, logical(0) indicates that you have a vector 
#  that's supposed to contain boolean values, but the vector has zero lengt
#길이가 0이므로 TRUE 값이 없으므로 if절이 실패합니다.

length(a)   #0

