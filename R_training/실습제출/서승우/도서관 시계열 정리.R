library(readxl)
src_dir<-c('c:\\semi\\data')
src_file <- list.files(src_dir)
src_file_cnt<-length(src_file)
a<-list()
for(i in 1:src_file_cnt){
  temp <- read_excel(paste0(src_dir, "/", src_file[i])) %>% select(도서명,대출건수)
  a <- append(a, temp)
}


b=list()
for (i in 1:12) {
  temp<-as.data.frame(cbind(a[[2*i-1]], a[[2*i]]), stringsAsFactors=F )
  temp$V2<-as.numeric(temp$V2)
  temp<-temp %>% arrange(desc(temp$V2))
  b[[i]]<-temp
}

head(b[[1]], 15)
head(b[[2]], 15)
head(b[[3]], 15)
head(b[[4]], 15)
head(b[[5]], 15)
head(b[[6]], 15)
head(b[[7]], 15)
head(b[[8]], 15)
head(b[[9]], 15)
head(b[[10]], 15)
head(b[[11]], 15)
head(b[[12]], 15)

