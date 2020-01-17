# df<-read.table('data/공구.txt',encoding = 'UTF-8')
# df<-read.csv('data/공구.txt',encoding = 'UTF-8')



word<-readLines('data/공구.txt',encoding = 'UTF-8')

useSejongDic()


add_words <- c("쭈꾸뽕", "공동구매", "에어워셔", "진공포장", "두유",'필립스')  #ex. 백수산이  ... 라서 


#ncn : 명사(체언_보통명사)라고 입력해서 사전에 추가 + replace_usr_dir = T  : 기존에 있으면 새롭게 바꾼다.
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)



df <- extractNoun(word)  #리스트 형태 풀어줘야지!!
df = unlist(df)
df
sum(df == '두유')

df <- gsub('[[:punct:][:digit:]A-z]','',df)       # 역슬래쉬 표현법:   \"


table(df)



## 두번 명사 추출하지 말자!!



df <- Filter(function(x){nchar(x)>=2},df)
df


df2 <- gsub('(^ㅂ)','',df)
# f2 <- gsub('^공','공구',df)

# 대단하다  .* !!!!!!!!!!!!!!!!!!!!
drword2 <- gsub('공구.*','공구',df2)  ;'0개'

drword2 <- gsub('공구.?','공구',df2)  ;'0개 ~ 1개'
drword2 <- gsub('공구.+','공구',df2)  ;'1개 이상' 

drword2 <- gsub('공구.*','',df2)

library(wordcloud2)



df3<- table(drword2)
result <- as.data.frame(df3)
View(result)

wordcloud2(result)


names(result)


library(wordcloud)
wordcloud(result$drword2 , result$Freq,
          min.freq = 2,
          scale = c(4,1),
          max.freq = 30,
          rot.per = 0.1,
          random.color=T,
          colors = rainbow(50))








#종현씨
rm(list=ls())

library(KoNLP)
library(wordcloud)
library(stringr)

data = readLines("data/공구.txt", encoding="UTF-8")
data_crop = NULL

for (i in 1:length(data)){
        temp = substr(data[i], 1, 2)
        if (temp %in% c('97', '98')){
                data_crop = c(data_crop, data[i])
        }
}

data_crop = gsub("[[:digit:][:punct:]]", "", data_crop)
data_crop = trimws(data_crop)

useSejongDic()

noun_data = extractNoun(data_crop)
noun_data = unlist(noun_data)

windowsFonts(lett=windowsFont("휴먼옛체"))

noun_data_2_char <- Filter(function(x) {nchar(x) >= 2}, noun_data)
word_table = table(noun_data_2_char)
final <- head(sort(word_table, decreasing=T),32)[-1:-2]
final = final[c(-10,-12)]

wordcloud(names(final), freq=final,scale=c(3,0.5),rot.per=0.35,min.freq=1,
          random.order=F,random.color=T,colors=rainbow(100))

png(filename="wc.png")
wordcloud(names(final), freq=final,scale=c(3,0.5),rot.per=0.35,min.freq=1,
          random.order=F,random.color=T,colors=rainbow(100))
dev.off()











#자연씨
library(KoNLP)
library(dplyr)

word_data <- readLines("C:/Rstudy/book/공구.txt",encoding="UTF-8")
word_data

useSejongDic()
word_data3 <- extractNoun(word_data)
word_data3

add_words <- c("파쉬", "공동구매","해주","에어워셔","진공포장", "두유", "리큅", "쭈꾸뽕", "주세", "필립스", "다이", "캠프", "진공포장","단시","소이","우반","주물","에어","프라","롱기","보이","캠프","세트","워머","프라이")#분류 되지 않은 단어들을 딕셔너리에 추가하는 함수 #책참고
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data3)

undata=gsub("[[:digit:]]","",undata)
undata=gsub("[[:punct:]]","",undata)
undata=gsub("[[:punct:]]","",undata)
undata=gsub("공구","",undata)
undata=gsub("해주","",undata)
undata=gsub("필요해요","",undata)

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)#글자수 2개 이상만 !!


word_table2 <- table(undata2)

final <- sort(word_table2, decreasing = T)
final=data.frame(final)
final

library(wordcloud)
setwd('C:/Rstudy/3주차-다양한 함수 패키지와 시각화/11월 7일')

png(filename="wc.png", height=400, width=700, bg="black") 

wordcloud(final$undata2, final$Freq, 
          random.order = FALSE, #큰 순서로 적용
          min.freq = 2, 
          rot.per = 0.1, #전체에서 10프로는 회전
          scale = c(4, 1),
          random.color=T,#제일 많이 등장한 폰트4 적게1
          colors = rainbow(40))#컬러 선택

dev.off()



          