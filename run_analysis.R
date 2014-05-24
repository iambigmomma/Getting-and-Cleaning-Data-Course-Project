run_analysis<-function(){
        
        x_test<-read.table("UCI HAR Dataset/test/X_test.txt") #Read the raw data about X_test
        y_test<-read.table("UCI HAR Dataset/test/Y_test.txt") #Read the raw data about Y_test
        x_train<-read.table("UCI HAR Dataset/train/X_train.txt") #Read the raw data about X_train
        y_train<-read.table("UCI HAR Dataset/train/Y_train.txt") #Read the raw data about Y_train
        activity<-read.table("UCI HAR Dataset/activity_labels.txt") #Read the activity label
        feature<-read.table("UCI HAR Dataset/features.txt")
        subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
        subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
        for (i in 1:nrow(activity)){
                y_test[y_test== i] <- as.character(activity[i,2]) #Grep the number equals to the activity, then assign it label
                y_train[y_train == i] <- as.character(activity[i,2])
                
        }
        #In here, I define mean and std as only variable ended with mean() or std(), so totally selected 20 variables.
        mean_std<-feature[grep("std[[:punct:]][^XYZ]$|mean[[:punct:]][^XYZ]$",feature[,2]),][,2]
        names(x_test)<-feature[,2]
        x_test_mean_std<-x_test[names(x_test) %in% mean_std]#Only select mean and std in columns
        test_subject_activity<- cbind.data.frame(subject_test,y_test)
        #names(test_subject_activity)<- c("Subject","Activity")
        test_data<-cbind.data.frame(test_subject_activity,x_test_mean_std)
        
        
        names(x_train)<-feature[,2]
        x_train_mean_std<-x_train[names(x_train) %in% mean_std]#Only select mean and std in columns
        train_subject_activity<- cbind.data.frame(subject_train,y_train)
        #names(train_subject_activity)<- c("Subject","Activity")
        train_data<-cbind.data.frame(train_subject_activity,x_train_mean_std)
        
        tidy.data<-rbind.data.frame(train_data,test_data)
        names(tidy.data)[1:2]<-c("subject","activity")
       # mean_std<-grep("std[[:punct:]][^XYZ]$|mean[[:punct:]][^XYZ]$",feature[,2])
       
       
       
       #Average 
       average_tidy_data<-aggregate(x=tidy.data[,-1:-2],by=list(subject=tidy.data$subject,activity=tidy.data$activity),FUN=mean)
       
      
       write.table(average_tidy_data,"/Users/iambigmomma/Desktop/Coursera/Getting and Cleaning Data Course Project/tidy_data.txt",sep="\t")
       return (average_tidy_data)
       
        

}