install.packages(c("RCurl", "XML"))
library(RCurl) #RCurl 라이브러리로 웹 서버에 접속
library(XML) #XML 라이브러리로 웹 문서 처리

t <- readLines('https://en.wikipedia.org/wiki/Coronavirus_disease_2019') #readLines 함수는 지정된 URL에서 html 파일을 읽어 옴
d <- htmlParse(t, asText = TRUE) #htmlParse와 xpathSApply 함수는 웹 문서를 R의 데이터 형으로 변환해 줌
clean_doc <- xpathSApply(d,"//p", xmlValue)
clean_doc


install.packages(c("tm", "SnowballC"))
library(NLP)
library(tm) #tm 라이브러리는 데이터 마이닝 함수 제공
library(SnowballC) #SnowballC 라이브러리는 어간을 추출하는 함수 제공

#tm_map 함수는 지정된 매개변수 값에 따라 전처리 수행
doc <- Corpus(VectorSource(clean_doc))
inspect(doc)
doc <- tm_map(doc, content_transformer(tolower)) #소문자 변경 
#doc <- tm_map(doc, removeNumbers) #숫자 제거
doc <- tm_map(doc, removeWords, stopwords('english')) #불용어 제거 
doc <- tm_map(doc, removePunctuation) #구두점 제거 
doc <- tm_map(doc, stripWhitespace) #어간 추출


#DTM 구축
dtm = DocumentTermMatrix(doc)
dim(dtm) #dim 함수는 DTM의 행과 열의 개수
inspect(dtm) #inspect 함수는 상세 내용을 요약 


#wordcloud그리기
install.packages("wordcloud")
library(RColorBrewer)
library(wordcloud)
m <- as.matrix(dtm) #as.matrix 함수는 DTM을 행렬 표현으로 변환
v <- sort(colSums(m), decreasing = TRUE) #sort 함수는 빈도(중요도)가 높은 순서로 단어를 정렬
d <- data.frame(word = names(v), freq = v)
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 50, random.order = FALSE, rot.per = 0.35)
#중요도가 높은 상위 50개만 그리라는 옵션, 세로로 배치할 단어의 비율을 35%로 하라는 옵션


#wordcloud2
install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(d)
d1 <- d[1:50, ] #50개 단어만 추출
wordcloud2(d1)
