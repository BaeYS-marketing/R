text <- readLines("data/memo.txt", encoding="UTF-8")
text
text <- text[nchar(text) > 0] # 빈 행 벡터 지우기
text

# 1행
text[1]
text[1] <- gsub("&", "", text[1]) 
text[1] <- gsub("\\$", "", text[1]) # ?
text[1] <- gsub("!", "", text[1]) 
text[1] <- gsub("#", "", text[1]) 
text[1] <- gsub("@", "", text[1]) 
text[1] <- gsub("%", "", text[1]) 
text[1]

# 2행
text[2]
text[2] <- gsub("e", "E", text[2])
text[2]

# 3행
text[3]
text[3] <- gsub("1", "", text[3])
text[3] <- gsub("2", "", text[3])
text[3]

# 4행
text[4]
text[4] <- gsub("R ", "", text[4])
text[4] <- gsub("Analysis", "", text[4])
text[4] <- gsub("Big", "", text[4])
text[4] <- gsub("Data", "", text[4])
text[4]

# 5행
text[5]
text[5] <- gsub("!", "", text[5])
text[5] <- gsub("12", "", text[5])
text[5] <- gsub("34", "", text[5])
text[5] <- gsub("56", "", text[5])
text[5] <- gsub("78", "", text[5])
text[5] <- gsub("<", "", text[5])
text[5] <- gsub(">", "", text[5])
text[5]

# 6행
text[6]
text[6] <- gsub(" ", "", text[6])
text[6]

# 7행
text[7]
text[7] <- gsub("YOU", "you", text[7])
text[7] <- gsub("OK", "ok", text[7])
text[7]

text

write.table(text, "memo_new.txt")
