gg<-readLines('data/공구.txt')
Encoding(gg)<-'UTF-8'
gg <- gg[nchar(x)>0]
gg<-gsub("[[:punct:]]", "", gg) 
gg<-gsub("[[:digit:]]", "", gg)
gg<-gsub("[A-Z]", "", gg)
gg<-gsub("[a-z]", "", gg)
gg<-gsub("  ", "", gg)
gg<-gg[gg!=""]


useSejongDic()
gg2 <- extractNoun(gg)
ungg<-unlist(gg2)
ungg2 <- Filter(function(x) {nchar(x) >= 2}, ungg)
ungg3 <- table(ungg2)
final<-sort(ungg3, decreasing=T)
final<-as.data.frame(final[c(-1,-2)])


windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud(final$ungg2, final$Freq, 
          min.freq = 2,         
          random.order = F, 
          rot.per = 0.3, scale = c(5, 3),  
          colors = rainbow(15),
          family='lett'
          )