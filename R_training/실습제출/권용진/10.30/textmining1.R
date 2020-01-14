library(rvest)

memo = readLines("c:/Rstudy/data/memo.txt", encoding = "UTF-8")

memo[1] = gsub("[@#$%&!]","", memo[1])
# gsub("\\$","",memo[1]) ///// fixed=T $를 정규표현식으로 인식하지 않도록!

memo[2] = gsub("e", "E", memo[2])

memo[3] = gsub("[1-2]", "", memo[3])

memo[4] = gsub("[A-Za-z]", "", memo[4])

memo[5] = gsub("[!1-8<>]", "", memo[5])

memo[6] = gsub(" ", "", memo[6])

memo[7] = gsub("YOU", "you", memo[7])
memo[7] = gsub("OK", "ok", memo[7])
memo

write(memo, "c:/Rstudy/data/memo_new.txt")