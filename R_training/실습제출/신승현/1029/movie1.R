url <- "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen"
text <- read_html(url, encording="CP949")
text

nodes <- read_html(text, "em.emph_grade")
nodes <- read_html(text, "p.desc_review")
html_text(nodes)
review <- html_text(nodes, trim=TRUE); review
review <-gsub("\t", "", review)
review <-gsub("\r\n", "", review)
review <-gsub("\n", "", review)
review <-gsub("신고", "", review); review


page <-data.frame(title, review)
write.csv(page, "daummovie1.csv")
getwd()
