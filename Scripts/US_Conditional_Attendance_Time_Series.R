# Fig. 1a -- Line plot

library(ggplot2)
library(data.table)
library(zoo)
library(dplyr)

time_series <- read.csv("C:/Users/Utilisateur/.../2023.06.11.PS_time_series.csv")

time_series_dt <- as.data.table(time_series)
time_series_dt_1 <- time_series_dt[,c("date","manager","manager_lb","manager_ub")]
time_series_dt_2 <- time_series_dt[,c("date","teammate","teammate_lb","teammate_ub")]
time_series_dt_3 <- time_series_dt[,c("date","both","both_lb","both_ub")]
time_series_dt_4 <- time_series_dt[,c("date","none","none_lb","none_ub")]

time_series_dt_1$type <- "Manager only"
time_series_dt_2$type <- "No manager, 1+ teammate(s)"
time_series_dt_3$type <- "Both"
time_series_dt_4$type <- "None"

names(time_series_dt_1) <- c("date","attendance","lb","ub","type")
names(time_series_dt_2) <- c("date","attendance","lb","ub","type")
names(time_series_dt_3) <- c("date","attendance","lb","ub","type")
names(time_series_dt_4) <- c("date","attendance","lb","ub","type")

date_breaks_long_1<-unique(time_series_dt_1$date)
date_breaks_long_2<-unique(time_series_dt_2$date)
date_breaks_long_3<-unique(time_series_dt_3$date)
date_breaks_long_4<-unique(time_series_dt_4$date)



time_series_dt_1 <- time_series_dt_1 %>%
  mutate(attendance_smoothed = rollmean(attendance, k=5, fill=NA, align='right'))
time_series_dt_2 <- time_series_dt_2 %>%
  mutate(attendance_smoothed = rollmean(attendance, k=5, fill=NA, align='right'))
time_series_dt_3 <- time_series_dt_3 %>%
  mutate(attendance_smoothed = rollmean(attendance, k=5, fill=NA, align='right'))
time_series_dt_4 <- time_series_dt_4 %>%
  mutate(attendance_smoothed = rollmean(attendance, k=5, fill=NA, align='right'))
time_series_dt_1[1:4,'attendance_smoothed'] <- time_series_dt_1[1:4,'attendance']
time_series_dt_2[1:4,'attendance_smoothed'] <- time_series_dt_2[1:4,'attendance']
time_series_dt_3[1:4,'attendance_smoothed'] <- time_series_dt_3[1:4,'attendance']
time_series_dt_4[1:4,'attendance_smoothed'] <- time_series_dt_4[1:4,'attendance']

time_series_dt_1$lb[which(time_series_dt_1$lb < 0)]<-0 
time_series_dt_2$lb[which(time_series_dt_2$lb < 0)]<- 0
time_series_dt_3$lb[which(time_series_dt_3$lb < 0)]<-0
time_series_dt_4$lb[which(time_series_dt_4$lb < 0)]<-0


time_series_dt_1 <- time_series_dt_1 %>%
  mutate(lb_smoothed = rollmean(lb, k=5, fill=NA, align='right'))
time_series_dt_2 <- time_series_dt_2 %>%
  mutate(lb_smoothed = rollmean(lb, k=5, fill=NA, align='right'))
time_series_dt_3 <- time_series_dt_3 %>%
  mutate(lb_smoothed = rollmean(lb, k=5, fill=NA, align='right'))
time_series_dt_4 <- time_series_dt_4 %>%
  mutate(lb_smoothed = rollmean(lb, k=5, fill=NA, align='right'))
time_series_dt_1[1:4,'lb_smoothed'] <- time_series_dt_1[1:4,'lb']
time_series_dt_2[1:4,'lb_smoothed'] <- time_series_dt_2[1:4,'lb']
time_series_dt_3[1:4,'lb_smoothed'] <- time_series_dt_3[1:4,'lb']
time_series_dt_4[1:4,'lb_smoothed'] <- time_series_dt_4[1:4,'lb']

time_series_dt_1 <- time_series_dt_1 %>%
  mutate(ub_smoothed = rollmean(ub, k=5, fill=NA, align='right'))
time_series_dt_2 <- time_series_dt_2 %>%
  mutate(ub_smoothed = rollmean(ub, k=5, fill=NA, align='right'))
time_series_dt_3 <- time_series_dt_3 %>%
  mutate(ub_smoothed = rollmean(ub, k=5, fill=NA, align='right'))
time_series_dt_4 <- time_series_dt_4 %>%
  mutate(ub_smoothed = rollmean(ub, k=5, fill=NA, align='right'))
time_series_dt_1[1:4,'ub_smoothed'] <- time_series_dt_1[1:4,'ub']
time_series_dt_2[1:4,'ub_smoothed'] <- time_series_dt_2[1:4,'ub']
time_series_dt_3[1:4,'ub_smoothed'] <- time_series_dt_3[1:4,'ub']
time_series_dt_4[1:4,'ub_smoothed'] <- time_series_dt_4[1:4,'ub']

names(time_series_dt_1) <- c("date","attendance","lb","ub","type","attendance_smoothed","lb_smoothed","ub_smoothed")
names(time_series_dt_2) <- c("date","attendance","lb","ub","type","attendance_smoothed","lb_smoothed","ub_smoothed")
names(time_series_dt_3) <- c("date","attendance","lb","ub","type","attendance_smoothed","lb_smoothed","ub_smoothed")
names(time_series_dt_4) <- c("date","attendance","lb","ub","type","attendance_smoothed","lb_smoothed","ub_smoothed")

time_series_dt_all <- rbind(time_series_dt_1,time_series_dt_2,time_series_dt_3,time_series_dt_4)

time_series_dt_all$type <- factor(time_series_dt_all$type,levels=c("None","Manager only","No manager, 1+ teammate(s)","Both"))
time_series_dt_all$date <- as.Date(time_series_dt_all$date,format="%m/%d/%Y")
time_series_dt_all$date <- rbind(time_series_dt_1$date,time_series_dt_2$date,time_series_dt_3$date,time_series_dt_4$date)

time_series_dt_all$date_clean<-rep(date_breaks_long_raw,4)

ggplot(data=time_series_dt_all,aes(x=date,y=attendance_smoothed,color=type,group=type)) + 
  geom_ribbon(aes(ymin = lb_smoothed, 
                  ymax = ub_smoothed,fill=type,group=type), alpha = 0.2) + 
  geom_line(lwd=1.2)+
  geom_vline(xintercept =as.Date("2022-02-28"),lwd=1,lty=2)+
  geom_vline(xintercept =as.Date("2022-03-28"),lwd=1,lty=2)+
  guides(fill=guide_legend(title="Present onsite"),color='none',
         breaks=c("None","No manager, 1+ teammate(s)","Manager only","Both"))+
  scale_color_manual(values=c(   "#273c75", "#c23616","#0097e6","#8c7ae6"))+
  scale_fill_manual(values=c( "#273c75",  "#c23616", "#0097e6","#8c7ae6"))+
 ylim(0,0.5)+
  xlim(as.Date("2022-01-28"), as.Date("2022-02-28"))+
  scale_x_continuous(breaks=date_breaks_long, labels=date_breaks_long_labs,
                     expand = c(0,0))+
  annotate( 'text',label='Pre',x=as.Date("2022-01-28"),y=0.02,size=8)+ 
  annotate( 'text',label='Post',x=as.Date("2022-04-28"),y=0.02,size=8)+
  annotate("rect", xmin = as.Date("2022-02-28"), xmax = as.Date("2022-03-28"), ymin = 0, ymax = 0.5,
           alpha = .2,fill="gray")+
  theme_bw()+
  ylab('Probability of attendance')+
  theme(text=element_text(size=17),
        axis.text.x = element_text(color="black",angle=90,vjust =1, hjust=1),
        axis.text.y = element_text(color="black"),
        legend.position=c(0.205,0.8),
        legend.text=element_text(size=17),
        legend.title=element_text(size=17),
        axis.title.x=element_blank())

