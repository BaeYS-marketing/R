library(KoNLP)
useSejongDic()

hotel <- readLines("hotel.txt")
hotel <- extractNoun(hotel)
hotel <- unlist(hotel)
hotel <- gsub("[^가-힣]","",hotel)
hotel <- Filter(function(x) {nchar(x)>=2},hotel)
head(sort(table(hotel),decreasing = T),20)
