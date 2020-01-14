setwd("C:/Rstudy/data")

#textmining1
data = readLines("memo.txt", encoding = "UTF-8")
data
data = data[nchar(data)>0] #문자열의 개수를 세주는 함수 nchar
data

data[1] = gsub("&", "", data[1])
data[1] = gsub("$", "", data[1], fixed = T)
data[1] = gsub("!", "", data[1])
data[1] = gsub("#", "", data[1])
data[1] = gsub("@", "", data[1])
data[1] = gsub("%", "", data[1])
data[1]

data[2] = gsub("e", "E", data[2])
data[2]

data[3] = gsub("1", "", data[3])
data[3] = gsub("2", "", data[3])
data[3]

data[4] = gsub("R ", "", data[4])
data[4] = gsub("Analysis", "", data[4])
data[4] = gsub("Big", "", data[4])
data[4] = gsub("Data", "", data[4])
data[4]

data[5] = gsub("!", "", data[5])
data[5] = gsub("12", "", data[5])
data[5] = gsub("34", "", data[5])
data[5] = gsub("56", "", data[5])
data[5] = gsub("78", "", data[5])
data[5] = gsub("<", "", data[5])
data[5] = gsub(">", "", data[5])
data[5]

data[6] = gsub(" ", "", data[6])
data[6]

data[7] = gsub("YOU", "you", data[7])
data[7] = gsub("OK", "ok", data[7])
data[7]

data

write(data, "memo_new.txt")

