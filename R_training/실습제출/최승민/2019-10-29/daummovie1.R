url3 <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text <- read_html(url3)
text 

score <- html_nodes(text, ".raking_grade > em")
rating <- html_text(score)
rating

nodes <- html_nodes(text, ".desc_review")
review <- html_text(nodes)
review

# nodes <- html_nodes(text, "div > p")
review <- html_text(nodes, trim=T)
review
review <- gsub("\t", "", review)
review <- gsub("[\r\n]", "", review)
review <- gsub("\n", "", review)
review <- gsub("신고", "", review)

page <- data.frame(rating, review)
write.csv(page, "daummovie1.csv")

