old <- readLines("data/memo.txt",encoding = "UTF-8")
old <- old[nchar(old) >0]
test <- NULL

# 1번
old[1] <- gsub("&","",old[1])
old[1] <- gsub("$","",old[1],fixed=T)
old[1] <- gsub("!","",old[1])
old[1] <- gsub("#","",old[1])
old[1] <- gsub("@","",old[1])
old[1] <- gsub("%","",old[1])
test[1] <-c("당신의 믿음은 곧 당신의 생각이 되고, 당신의 생각은 곧 당신이 내뱉는 말이 되고, 당신이 내뱉는 말은 곧 당신의 행동이 되고, 당신의 행동은 곧 당신의 습관이 되고, 당신의 습관은 곧 당신의 가치관이 되고, 당신의 가치관은 곧 당신의 운명이 된다.")

# 2번
old[2] <- gsub("e","E",old[2])
test[2] <- c("중요한 일을 절대 E메일로 보내지 마라!")

# 3번
old[3] <- gsub("1","",old[3])
old[3] <- gsub("2","",old[3])
test[3] <- c("가장 훌륭한 일은 모험과 도전정신으로 이루어진다.")

# 4번
old[4] <- gsub(" R","",old[4])
old[4] <- gsub("Analysis","",old[4])
old[4] <- gsub("Big","",old[4])
old[4] <- gsub("Data","",old[4])
test[4] <- c("남들이 나와 같지 않다는 점을 인정하라.")

# 5번
old[5] <- gsub("!","",old[5])
for (i in 1:8){
  old[5] <- gsub(i,"",old[5])
}
old[5] <- gsub("<","",old[5])
old[5] <- gsub(">","",old[5])
test[5] <- c("매일 아침 삶의 목표를 생각하며 일어나라.")

# 6번
old[6] <- gsub(" ","",old[6])
test[6] <- c("위대한일을하는유일한방법은바로당신이하는일을사랑하는것입니다.")

# 7번
old[7] <- gsub("  "," ",old[7])
old[7] <- gsub("YOU","you",old[7])
old[7] <- gsub("OK","ok",old[7])
test[7] <- c("you 타협(정착)하지 마세요. 왜냐하면, 당신의 마음이 하는 모든 것이 그렇듯이, 그 일을 찾게 되면 당신은 마음으로 알게 될 겁니다. ok?")

# 확인
check <- NULL
for (i in 1:length(test)){
  check[i] <- (old[i] == test[i])
}
if (!any(!check)) print("모두 일치")
