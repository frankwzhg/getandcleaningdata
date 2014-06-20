####funciotn for add activity name in to lables dataset
addAName<-function(dataset){
        dataset$AName<-NA
        for(i in 1:6){
                if(i==1) dataset$AName<-"WALKING"
                else if(i==2) dataset$AName<-"WALKING_UPSTAIRS"
                else if(i==3) dataset$AName<-"WALKING_DOWNSTAIRS"
                else if(i==4) dataset$AName<-"SITTING"
                else if(i==5) dataset$AName<-"STANDING"
                else dataset$AName<-"LAYING"
        }
        return(dataset)
}

##seting work directory
setwd("/home/frank/datagl/uci_har_dataset/")
###load train dataset
T_lables<-read.table("./train/y_train.txt")
X_train_data<-read.table("./train/X_train.txt")
sub_train<-read.table("./train/subject_train.txt")
###load test dataset
sub_test<-read.table("./test/subject_test.txt")
X_test_data<-read.table("./test/X_test.txt")
TS_lables<-read.table("./test/y_test.txt")
###load feature.txt into R
features<-read.table("features.txt")
###add activity name for trainning dataset and testing dataset
T_lables<-addAName(T_lables)
TS_lables<-addAName(TS_lables)
####rename dataset colname
colnames(X_train_data)<-features$V2
colnames(X_test_data)<-features$V2
###merge dataset
#####merge train dataset with train_lable and sub_train
########VNum is volunteer number
colnames(sub_train)<-"VNum"
###cbind T_lables, sub_train and train_dataset
train_data<-cbind(VNum=sub_train$VNum, AName=T_lables$AName, X_train_data)
######merge test dataset with test_lable and sub_test
#######VNum is volunteer number
colnames(sub_test)<-"VNum"
#####cbing TS_lables, sub_test and test_datset
test_data<-cbind(VNum=sub_test$VNum, AName=TS_lables$AName, X_test_data)
###merge train data and test data
all_data<-rbind(train_data, test_data)
write.table(all_data, file="all_data.txt")
###find mean and sd row number
col_mean<-grep("mean", colnames(all_data))
col_std<-grep("std", colnames(all_data))
col_num<-c(col_mean, col_std)
###Extracts only the measurements on the mean and standard deviation for each measurement
mean_std_data<-all_data[,col_num]
write.csv(mean_std_data, file="MSTD_data.csv")
####Creates a second, independent tidy data set with the average of each variable for each activity and each subject
mean_vas<-melt(all_data, id=c("AName", "VNum"))
colnames(mean_vas)[3]<-"features"
colnames(mean_vas)[4]<-"mean"
mean_vas<-data.table(mean_vas)
mean_vas<-mean_vas[, mean(mean), by="AName,VNum,features"]
write.csv(mean_vas, file="mean_vas.csv")
rm(list=ls())