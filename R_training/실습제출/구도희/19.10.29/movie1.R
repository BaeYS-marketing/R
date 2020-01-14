url5 <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
txt <- read_html(url5)

nodes1 <- html_nodes(txt,".emph_grade")
title1 <- html_text(nodes1)

nodes1 <- html_nodes(txt, ".desc_review")
review2 <- html_text(nodes1, trim=TRUE)

page1 <- data.frame(title1, review2)
write.csv(page1, "daummovie1.csv")


