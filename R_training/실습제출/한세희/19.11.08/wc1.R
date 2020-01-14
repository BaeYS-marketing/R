# 문제1
data <- readLines("c://Rstudy/data/공구.txt", encoding = "UTF-8")
useSejongDic()
windowsFonts(lett=windowsFont("휴먼옛체"))
undata <- unlist(data)

data1 <- gsub("[[:digit:][:punct:][:upper:][:lower:]]","", undata)

add_words <- c("파쉬","진공포장","영어","보네","전기","덴비","공동구매",
               "프라이","재공","언제","한과","캠프","세트","리큅","사과",
               "냄비","쭈꾸뿅","롱기","다이","피립스","두유","가죽","온수",
               "소이","필립스","에어","프라","무선","워머","우반","주물",
               "매트","단시","무선","스팀","단시","주세","보이","가습기",
               "슬러","필해","리큅건조기","청소기","에어워셔")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

data1 = trimws(data1)

data2 <- unlist(extractNoun(data1))
data3 = Filter(function(x) {nchar(x) >= 2}, data2)
data4 = table(data3)
final <- sort(data4, decreasing=T)
str(final)
final1 <- as.data.frame(final)

wordcloud(final1$data3, final1$Freq, 
          min.freq = 2,
          random.order = FALSE, 
          rot.per = 0.1, scale = c(8, 2),
          colors = rainbow(7))

