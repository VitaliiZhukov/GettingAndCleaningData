X_train<-read.table("Dataset/train/X_train.txt")
X_test<-read.table("Dataset/test/X_test.txt")
Y_train<-read.table("Dataset/train/y_train.txt")
Y_test<-read.table("Dataset/test/y_test.txt")
subject_train<-read.table("Dataset/train/subject_train.txt")
subject_test<-read.table("Dataset/test/subject_test.txt")
features<-read.table("Dataset/features.txt")
features$V2<-as.character(features$V2)

train<-cbind(subject_train,Y_train,X_train)
test<-cbind(subject_test,Y_test,X_test)
dataset<-rbind(train,test)
ids<-features[((grepl("mean",features$V2)|grepl("std",features$V2))),1]
ids<-ids+2 # сдвиг на 2 позиции вправо, т. к. первые два поля - это subject_id и y
dataset<-dataset[,c(1,2,ids)]
dsNames<-features[((grepl("mean",features$V2)|grepl("std",features$V2))),2]
colnames(dataset)<-as.factor(c("subjectID","activityID",dsNames))

newDS<-data.frame(matrix(ncol = ncol(dataset), nrow = 0),row.names=NULL)
for (i in 1:30){
  for (j in 1:6){
    newRAW<-c(i,j)
    for (k1 in 3:ncol(dataset)){
      smallDS<-dataset[(dataset$subjectID==i & dataset$activityID==j),k1]
      mn<-mean(smallDS)      
      newRAW<-c(newRAW,mn)
    }
    newDS<-rbind(newDS,newRAW)
  }
}
colnames(newDS)<-colnames(dataset)
write.table(newDS,file="newDS.txt",row.name=FALSE)

activities<-read.table("Dataset/activity_labels.txt")
dataset$activity_labels<-activities[dataset$activityID,2]
