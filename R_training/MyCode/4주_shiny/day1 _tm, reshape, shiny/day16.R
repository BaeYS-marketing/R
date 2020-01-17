
#Kormaps 지역 뽑아내는 것 보충 
#강남구에 해당하는 동만 찾는 코드 ~ grep이용
library(Kormaps)
data(korpopmap2)
data(korpopmap3)

'korpopmap2'
Encoding(korpopmap2@data$name)<-'UTF-8'
korpopmap2@data$code.data
korpopmap2@data$name
gucodename <- korpopmap2@data[,c("name", "code.data")]

'korpopmap3'
names(gucodename)
Encoding(korpopmap3@data$name)<-'UTF-8'
korpopmap3@data$code.data
korpopmap3@data$name


'grep'
guname <- '강남구'
gucode <- gucodename[gucodename$name == guname, "code.data"]
pattern <- paste0('^', gucode)
korpopmap3@data[grep(pattern, korpopmap3@data$code.data),  #grep : 파일 전체를 뒤져 정규표현식에 대응하는 모든 행들을 출력한다.
                c("code.data", "name")]                    # ^ : 행의 시작 지시자




#정규표현식 보충

gsub("ABC", "***", "ABCabcABC")  #ABC를 **로 변환
gsub("ABC", "***", "ABCabcABC", ignore.case=T)    #대소문자 무시 = T 
x<-c("ABCabcABC", "abcABCabc")
gsub("ABC", "***", x)              #백터의 원소마다 적용되는 것을 확인 
gsub("b.n", "***", "i love banana")  #b와 n사이에 임의의 문자 1개
gsub("b.*n", "***", "i love banana")  #b 와 n 사이에 문자모두(0번 이상)      +:1번이상  /  ? : 0~1번
gsub("lo.*n", "***", "i love banana")  # lo 와 n사이에 문자모두  
gsub("[bn]a", "***", "i love banana")  #ba 또는 na  
gsub("010-[0-9]{4}-[0-9]{4}", "010-****-****", "내 폰번호는 010-1234-6789")  #{4} 개  {3,4} 3개 이상, 4개 이하 
gsub("010-\\d{4}-\\d{4}", "010-****-****", "내 폰번호는 010-1234-6789")    #\\d는 \d를 온전히 전달할 때    
gsub(" +", " ", "i   love    banana")   # 공백이 한번이상(+)








#apply계열 함수들 , 아규먼트로 함수 받을 수 있고 리턴값으로 함수를 받아올 수 있는 고차원함수

weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F", "M", "M", "F", "F")

df <- data.frame(w=weight, h=height)
df

df3 <- data.frame(w=weight, h=height,g=gender)

#열단위, 행단위 작업선택 가능 
apply(df, 1, sum, na.rm=TRUE)  #4번째 아규먼트 3번쨰 아규먼트 함수에 적용되는 아규먼트 (sum함수의 아규먼트를 적용)  / 행  : 몸무게 +키     
apply(df, 2, sum, na.rm=TRUE)  #열  : 몸무게total, 키total


# 열단위 작업이다
#첫번쨰 아규먼트는 타입은 상관없지만 lapply는 열단위 작업 후 리스트 반환 , 
# sapply는 가급적 심플하게,  백터로 반환되면 백터 / 여러타입이 섞여있으면 데이터프레임,리스트
lapply(df, sum, na.rm=TRUE)
sapply(df, sum, na.rm=TRUE)


#첫번째 야규먼트 데이터를 2번째 아규먼트로 그룹핑하여 3번째 아규먼트 함수수행
#dpylr 에서 대체되기 때문에 사용도가 낮다. 
tapply(df$w, gender, mean, na.rm=TRUE)
tapply(1:6, gender, sum, na.rm=TRUE)


#첫번째 아규먼트에 함수가 오고 
#; 뒤에는 백터가 제한없이 오고 ; 각 백터의 스칼라값을 인덱싱대로 모아 작업 수행 
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])




#자주사용하는 sapply가 중요한 이유 : 만든 함수로 작업수행이 가능하다.
count <- 1  
myf <- function(x, wt=T){
        print(paste(x,"(",count,")"))
        Sys.sleep(5)
        if(wt) 
                r <- paste("*", x, "*")
        else
                r <- paste("#", x, "#")
        count <<- count + 1;
        return(r)     
        #전달된 원소에 따라 리턴값을 백터에 보관하고 있다가 수행이 다끝나고 한번에 출력 
}
sapply(df$w, myf)
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)


count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]


r <- sapply(df, myf)
str(r)









library(KoNLP)        #형태소 분석 패키지
library(wordcloud)
library(RColorBrewer)
library(stringr)
useSejongDic()
# install.packages("tm")  :  텍스트마이닝 전용패키지, 단순히 명사추출을 넘어선 분석을 할 때 비정형데이터를 어느정도 정형데이터로 만들어주는 작업(행렬)
library(tm)


#6명 학생이 먹은 점심메뉴  _ 학생들이 제일 좋아하는 음식은 뭘까?, 인기있는 조합은 뭘까?
lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

'tm패캐지는 텍스트를 다룰 떄 코포스(말뭉치) 객체를 만들어서 이용한다.
코포스를 만들기 위한 소스가 필요 '
cps <- VCorpus(VectorSource(lunch))  #백터소스객체를를 이용해서 V코포스 객체 생성  , 백터가 갖고있는 원소단위를 도큐먼트라고 한다. 
tdm <- TermDocumentMatrix(cps)        # TDM(가로 단어 세로 도큐먼트), DTM(가로 도큐먼트 세로 단어) 
tdm
as.matrix(tdm)            #커피, 귤, 오뎅.. 왜 빠져있을까? > 글자수 때문에 




cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))   #글자수 설정; inf :무한대 
tdm
(m <- as.matrix(tdm))


# dtm <- DocumentTermMatrix(cps,
                          # control = list(wl = c(1,Inf)))


# as.matrix(dtm)
# as.matrix(t(dtm))


colnames(m) <- c("doc1", "doc2", "doc3", "doc4", "doc5", "doc6")


rowSums(m)
colSums(m)


'tdm %*% dtm = co-ocurrence matrix  : ttm  _ d는 연결알고리즘'
com <- m %*% t(m)    # %*% :행렬곱  /   t() : 전치행렬 함수 
com







#그림으로 관계도 보기  

# install.packages("qgraph")
library(qgraph)

qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*3500))
#diag = 자기자신 관계삭제
#너무 격차가 심하게 차이날 때 그 격차를 줄일 때(정규화/표준화 할 때) log나 root 이용



# install.packages("proxy")   #문서 유사도 분석함수
library(proxy)
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)
cps <- Corpus(VectorSource(dd))    #소스에 한글에 있어서Vcorpus를 사용했고, 이번엔 영문이라 Corpus함수도 사용했다.
dtm <- DocumentTermMatrix(cps)     #문서가 메인이라서 
as.matrix(dtm)
inspect(dtm)      #2개 다 보여준다.          
m <- as.matrix(dtm)
com <- m %*% t(m)  #행렬 곱 연산 _ DTM은 도큐먼트가 남는다.
com

#연관도를 눈으로 말고 함수로도 볼 수 있다.
dist(com, method = "cosine")     #코사인 각도로 좁을수록 연관도 높다. 
dist(com, method = "Euclidean")  #피타고라스 정리로 점 거리_ 적을수록 연관도 높다.  
# install.packages("lsa")


library(lsa)  #여긴 아예 코사인 함수도 있긴 있다.  ~ 작을수록 각도  가깝다. 
cosine(com)         

# Install
# install.packages("tm")  # 텍스트 마이닝을 위한 패키지
# install.packages("SnowballC") # 어간추출을 위한 패키지
# install.packages("wordcloud") # word-cloud generator 
# install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)

# VectorSource () 함수는 문자형 벡터 모음을 만듭니다.
docs <- Corpus(VectorSource(text))


# 텍스트의 특수 문자 등을 대체하기 위해 tm_map () 함수를 사용하여 변환이 수행됩니다.
# “/”,“@”및“|”을 공백으로 바꿉니다.
# gsub보다 좀더 고차원적인 함수 


'content_transformer는 Corpus를 인식할 수 있게끔 변환
 tm_map 첫번째 아규먼트가 두번째 아규먼트 함수에 인자로 들어가고
 세 번째 아규먼트는 추가적인 인자로 두 번째 아규먼트에 들어간다. '
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")


#이해
my_transfomer_func = function(x , pattern ){
        gsub(pattern, " ", x)
}


toSpace <- content_transformer(my_transfomer_func)
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")





# 소문자로 변환
docs <- tm_map(docs, content_transformer(tolower))
# 수치 데이터 제거
docs <- tm_map(docs, removeNumbers)
# 영어 불용어(그 도큐먼트안에서 의미없다고 여겨지는 단어) 제거  / 한글은 지원X
docs <- tm_map(docs, removeWords, stopwords("english"))

# 벡터 구조로 사용자가 직접 불용어  설정 , 제거
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 

# 문장 부호 punctuations
docs <- tm_map(docs, removePunctuation)

# 공백 제거
docs <- tm_map(docs, stripWhitespace)

# 텍스트 형태소 분석 : 어간으로 통일시키는 것 :  근데 이 함수는 한국어하고는 맞지 않는다. 
# docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
.
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))