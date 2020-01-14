line = readLines('data/memo.txt',encoding = 'UTF-8')
line = line[nchar(line)>0]

# 라인 1

line[1] = gsub('&','',line[1])
line[1] = gsub('$','',line[1])
line[1] = gsub('!','',line[1])
line[1] = gsub('#','',line[1])
line[1] = gsub('@','',line[1])
line[1] = gsub('%','',line[1])
line[1]

# 라인 2
line[2] = gsub(pattern = '([[:lower:]])', perl = TRUE, replacement = '\\U\\1', line[2])

# 라인 3
line[3] = gsub('1','',line[3])
line[3] = gsub('2','',line[3])

# 라인 4
line[4] = gsub('[[:lower:]]','',line[4])
line[4] = gsub('[[:upper:]]','',line[4])
line[4] = gsub('  ',' ',line[4])

# 라인 5
line[5] = gsub('[[:punct:]]','',line[5])
line[5] = gsub('[[:digit:]]','',line[5])
line[5] = gsub('  ',' ',line[5])

# 라인 6
line[6] = gsub(pattern = '([[:upper:]])', perl = TRUE, replacement = '\\L\\1', line[6])
