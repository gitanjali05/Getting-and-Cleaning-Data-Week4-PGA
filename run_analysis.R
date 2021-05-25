library(dplyr)

setwd("C:/Users/Gitu/Desktop/Elective/Cleaning Data/UCI HAR Dataset/")
X_train<-read.table("./train/X_train.txt")
Y_train<-read.table("./train/y_train.txt")
sub_train<-read.table("./train/subject_train.txt")

X_test<-("./test/X_test.txt")
Y_test<-("./test/y_test.txt")
sub_test<-read.table("./test/subject_test.txt")

var_names<-read.table("./features.txt")
act_labels<-read.table("./activity_labels.txt")

x_tot<-rbind(X_train,X_test)
y_tot<-rbind(Y_train,Y_test)
sub_tot<-rbind(sub_train,sub_test)


selected_var <- var_names[grep("mean\\(\\)|std\\(\\)",var_names[,2]),]
x_tot <- x_tot[,selected_var[,1]]

colnames(y_tot) <- "activity"
y_tot$activitylabel <- factor(y_tot$activity, labels =  as.character(act_labels[,2]))
activitylabel <- y_tot[,-1]

colnames(x_tot) <- var_names[selected_var[,1],2]

colnames(sub_tot) <- "subject"
total <- cbind(x_tot, activitylabel, sub_tot)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./tidydata.txt", row.names = FALSE)