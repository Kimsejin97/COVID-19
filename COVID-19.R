#코로나 19 발생과 관련된 데이터 수집, 분석

data <- read.csv(file = './data/kr_daily.csv') #확진 추이, 검사와 확진 비율,
region_data <- read.csv(file = './data/kr_regional_daily.csv') #시도별 코로나 확진자 시각화 

str(data)
str(region_data)

##한글 깨짐
#install.packages("extrafont")
#library(extrafont)
#theme_set(theme_gray(base_family='NanumGothic'))
#theme_set(theme_gray(base_family='AppleMyungjo'))


#누적확진자 그래프
sum(is.na(data$confirmed))
sum(is.na(data$date))
data$confirmed
data$date

library(ggplot2)

theme_set(theme_minimal())
ggplot(data=data,aes(x=date,y=confirmed)) + 
geom_line() +
geom_point() +
ggtitle("코로나 누적 확진자") +
theme(plot.title = element_text(
                    family="NanumGothic",
                    face="bold",
                    hjust=0.5,
                    vjust=1,
                    size=20)) 


#지역별 확진자 상황
sum(is.na(region_data$region))
sum(is.na(region_data$confirmed))
region_data$region
region_data$confirmed

region_confirmed <- subset(region_data, date==20200621) #2020/06/21일 기준 
region_confirmed

ggplot(data=region_confirmed, aes(x=reorder(region, confirmed), y=confirmed)) + 
  geom_bar(stat='identity') + 
  coord_flip()+ 
  labs(x='', y='', title='지역별 확진자 상황') +
  theme(plot.title = element_text(
    family="NanumGothic",
    face="bold",
    hjust=0.5,
    vjust=1,
    size=20)) +
  geom_text(aes(label=confirmed), size=3, hjust=0, color="black")


#지역별 확진자 지도 시각화

