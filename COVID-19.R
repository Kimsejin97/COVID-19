#$)CDZ7N3* 19 9_;}0z 0|7C5H 5%@LEM <vA}, :P<.

data <- read.csv(file = './data/kr_daily.csv') #$)CH.Ax C_@L, 0K;g?M H.Ax :q@2,
region_data <- read.csv(file = './data/kr_regional_daily.csv') #$)C=C55:0 DZ7N3* H.Ax@Z =C0"H- 

str(data)
str(region_data)

##$)CGQ1[ 1zA|
#install.packages("extrafont")
#library(extrafont)
#theme_set(theme_gray(base_family='NanumGothic'))
#theme_set(theme_gray(base_family='AppleMyungjo'))


#$)C4)@{H.Ax@Z 1W7!GA
sum(is.na(data$confirmed))
sum(is.na(data$date))
data$confirmed
data$date

library(ggplot2)

theme_set(theme_minimal())
ggplot(data=data,aes(x=date,y=confirmed)) + 
geom_line() +
geom_point() +
ggtitle("$)CDZ7N3* 4)@{ H.Ax@Z") +
theme(plot.title = element_text(
                    family="NanumGothic",
                    face="bold",
                    hjust=0.5,
                    vjust=1,
                    size=20)) 


#$)CAv?*:0 H.Ax@Z ;sH2
sum(is.na(region_data$region))
sum(is.na(region_data$confirmed))
region_data$region
region_data$confirmed

region_confirmed <- subset(region_data, date==20200621) #2020/06/21$)C@O 1bAX 
region_confirmed

ggplot(data=region_confirmed, aes(x=reorder(region, confirmed), y=confirmed)) + 
  geom_bar(stat='identity') + 
  coord_flip()+ 
  labs(x='', y='', title='$)CAv?*:0 H.Ax@Z ;sH2') +
  theme(plot.title = element_text(
    family="NanumGothic",
    face="bold",
    hjust=0.5,
    vjust=1,
    size=20)) +
  geom_text(aes(label=confirmed), size=3, hjust=0, color="black")


#$)CAv?*:0 H.Ax@Z Av55 =C0"H-

