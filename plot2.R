#Read in the file.  Make sure the data file is in your working directory.
library(dplyr)
e<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
e$Date<-as.Date(e$Date,"%d/%m/%Y")
e2<-filter(e,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
e2$Global_active_power<-as.numeric(e2$Global_active_power)
x<-paste(e2$Date,e2$Time)
e2$Date_Time<-strptime(x, "%Y-%m-%d %H:%M:%S")
rm("x")

#Plot 2
png("./plot2.png",width=480,height=480)
with(e2,plot(Date_Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()  
