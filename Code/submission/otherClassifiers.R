library("randomForest")
library('caret')
library('kernlab')
# data1 <- read.csv('~/NCSU-git/ActivityRecognition/data/NewData/ADL1.csv',header=F)
# data2 <- read.csv('~/NCSU-git/ActivityRecognition/data/NewData/ADL2.csv',header=F)
# data3  <- read.csv('~/NCSU-git/ActivityRecognition/data/NewData/ADL3.csv',header=F)
# 
# data4  <- read.csv('~/NCSU-git/ActivityRecognition/data/NewData/ADL4.csv',header=F)
# data5 <- read.csv('~/NCSU-git/ActivityRecognition/data/NewData/ADL5.csv',header=F)
training = read.csv('~/NCSU-git/ActivityRecognition/data/NewData/ADL_Train.csv',header=F)
training[,1] <- as.factor(training[,1])
training[,2] <- as.factor(training[,2])
testing = read.csv('~/NCSU-git/ActivityRecognition/data/NewData/ADL_Test.csv',header=F)
testing[,1] = as.factor(testing[,1])
testing[,2] = as.factor(testing[,2])
model <- randomForest(V2 ~ V1, data=training)
predicted <- predict(model, testing[,1])
testtable(as.factor(testing[,2]),predicted)
confusionMatrix(as.factor(testing[,2]),predicted)

model <- knn(training[,-2], testing[,-2], cl = as.factor(training[,2]),k =6 )
predicted = as.factor(model)
confusionMatrix(as.factor(testing[,2]),predicted)


