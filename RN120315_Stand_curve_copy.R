library(drc)
library(sfsmisc)
library(Hmisc)

sleep<-read.csv("120316 Two step Sample.csv", header=TRUE)
crazy<-read.csv("120316 One step Sample.csv", header=TRUE)

x<-sleep[1]
y<-sleep[2:49]
a<-crazy[1]
b<-crazy[2:49]

j<-1
quartz()
opl<-mult.fig(48)
for (i in 1:48)
	{
		sleep.m<-drm(y[[i+9*(j-1)]]~X, data=sleep,fct=LL.4())
		plot(sleep.m, main=names(sleep[i+9*(j-1)+1]),ylab="Ct",xlab="proportion of plamsa",col="blue", ylim=c(25,2))
		crazy.m<-drm(b[[i+9*(j-1)]]~X, data=crazy,fct=LL.4())
		plot(crazy.m,main=names(crazy[i+9*(j-1)+1]),ylab="Ct",xlab="proportion of plamsa", col="red", ylim=c(25,2),add=TRUE)
		}
		