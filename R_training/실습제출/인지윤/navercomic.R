site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
comic.review <- NULL
i = 1

repeat {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, ".challengeTitle")
  comicName <- html_text(nodes, trim=TRUE)
  nodes <- html_nodes(text, ".summary")
  comicSummary <- html_text(nodes, trim=TRUE)
  nodes <- html_nodes(text, ".rating_type > strong")
  comicGrade <- html_text(nodes, trim=TRUE)
  page <- data.frame(comicName, comicSummary, comicGrade)
  comic.review <- rbind(comic.review, page)
  if (html_text(html_nodes(text, ".num_page"),trim=TRUE) < i)
    break
  i=i+1
}

write.csv(comic.review, "c:/Rstudy/navercomic2.csv")
