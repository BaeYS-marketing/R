site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="

navercomic <- NULL
i = 1

repeat {
  url <- paste(site, i, sep = "")
  text <- read_html(url, encoding = "UTF-8")
  # 이름
  nodes <- html_nodes(text, ".challengeTitle")
  comicName <- html_text(nodes, trim = TRUE)
  comicName <- gsub("\r\n", "", comicName)
  # 요약
  nodes <- html_nodes(text, ".summary")
  comicSummary <- html_text(nodes)
  # 평점
  nodes <- html_nodes(text, ".rating_type")
  comicGrade <- html_text(nodes)
  comicGrade <- gsub("\r\n", "", comicGrade)
  comicGrade <- gsub("평점", "", comicGrade)
  page <- data.frame(comicName, comicSummary, comicGrade)
  navercomic <- rbind(navercomic, page)
  i = i + 1
  # 반복문 빠져나오기 # 마지막 페이지 알아내서
  if(is.na(comicName[24]))
    break;
}

write.csv(navercomic, "navercomic.csv")
