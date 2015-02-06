#Read in the file.  Make sure the data file is in your working directory.
library(dplyr)
e<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
e$Date<-as.Date(e$Date,"%d/%m/%Y")
e2<-filter(e,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
e2$Global_active_power<-as.numeric(e2$Global_active_power)
x<-paste(e2$Date,e2$Time)
e2$Date_Time<-strptime(x, "%Y-%m-%d %H:%M:%S")
rm("x")

#Plot 4 
png("./plot4.png",width=480,height=480)
par(mfrow=c(2,2),cex.axis=1,cex.lab=1,mar=c(4,4,2,1),mgp=c(2,.5,0))
with(e2,plot(Date_Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
with(e2,plot(Date_Time,Voltage,type="l",ylab="Voltage",xlab="datetime"))
with(e2, plot(Date_Time,Sub_metering_1,xlab="",ylab="Energy sub metering",type = "l"))
with(e2,lines(Date_Time,Sub_metering_2, col = "red"))
with(e2,lines(Date_Time,Sub_metering_3, col = "blue"))
legend("topright", bty="n",cex=.85,lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(e2,plot(Date_Time,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reative_power"))
dev.off()

