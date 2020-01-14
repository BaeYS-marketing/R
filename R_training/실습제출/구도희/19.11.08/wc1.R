library(KoNLP)
useSystemDic()
useSejongDic()
useNIADic()

png(filename="wc.png", height=400, width=700, bg="white")
gong <- readLines("공구.txt")
Encoding(gong) <- 'UTF-8'
ggong <- unlist(extractNoun(gong))
ggong

ggong2 <- Filter(function(x) {nchar(x) >= 2}, ggong)
ggong2 <- gsub("[^가-힣]", "", ggong2) 

ggong2 <- gsub("[해주세요]","",ggong2)
ggong2 <- gsub("공구","",ggong2)
ggong2 <- gsub("언제하시나","",ggong2)
ggong2 <- gsub("[는]","",ggong2)
ggong2 <- gsub("[어떨까]","",ggong2)
ggong2 <- gsub("[기다립니다]","",ggong2)

ggong2 <- Filter(function(x) {nchar(x) >= 2}, ggong2)
ggong2

ggong_table <- table(ggong2)
ggong_table
gfinal <- sort(ggong_table, decreasing = T)


gresult <- data.frame(gfinal)

library(wordcloud)
wordcloud(gresult$ggong2, gresult$Freq, 
          min.freq = 2,
          random.order = FALSE,
          rot.per = 0.1, scale = c(4, 1),
          colors=brewer.pal(9,"Set1"),random.color = T)
dev.off()

# ggong2 <- gsub("공구.?","",ggong2)
# ggong2 <- gsub("공구.*","",ggong2)
# ggong2 <- gsub("공구.+","",ggong2) => 1개 이상

display.brewer.all()
ggong2 <- gsub(
  "[^파쉬진공포장영어덴비보네전기공동구매재공프라이세트리큅언제사과한과냄비쭈꾸뽕가죽온수에어무선프라스팀필해가습기슬러청소기에어워셔리큅건조기건조기보이매트주세주물우반소히필립스두유롱기다이캠프세트프라이덴비영어보네재공]",
  "",ggong2)

