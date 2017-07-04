# Reading the files that include user-readable names of fields
features <- read.table("features.txt", sep="", header=FALSE, strip.white=TRUE)
activities <- read.table("activity_labels.txt", sep="", header=FALSE, strip.white=TRUE)
  
# Since the structure of the test and train data sets is very similar structuring as a for loop
fileset <- c("test","train")
headeradded <- FALSE

for (whichfile in fileset)
{
# Reading X, Y and subject files for test and train
  Y <- read.table(paste(whichfile,"/Y_",whichfile,".txt",sep=""), sep="", header=FALSE, strip.white=TRUE, colClasses="numeric")
  X <- read.table(paste(whichfile,"/X_",whichfile,".txt",sep=""), sep="", header=FALSE, strip.white=TRUE, colClasses="numeric")
  subjects <- read.table(paste(whichfile,"/subject_",whichfile,".txt",sep=""), sep="", header=FALSE, strip.white=TRUE, colClasses="numeric")
  
# Creating a vector with the same number of rows as the data file, but using the human readable names for activities
  activityvec <- activities[Y[,1],2]
  
# Creating a vector indicating whether this data came from the train or test data set
  typevec <- rep(whichfile,times=dim(Y)[1])
  
  output <- cbind(typevec, subjects, activityvec,X)
  headers <- c("Sample-Type","Subject","Activity", as.character(features[[2]]))
  signalset <- dir(paste(whichfile,"/Inertial Signals/",sep=""))
  
# Appending the data from the inertial files
  for (whichsignal in signalset) 
  {
    varname = strsplit(dir("test/Inertial Signals/")[1],"_test")[[1]][1]
    
    signal <- read.table(paste(whichfile,"/Inertial Signals/",whichsignal,sep=""), sep="", header=FALSE, strip.white=TRUE, colClasses="numeric")
    
# Creating a name for each column, including the name from the file and a number identifier
    varnum = seq(from=1,to=128)
    signal_header <- paste(rep(varname,times=128),varnum,sep="_")
    
    headers <- c(headers,signal_header)
    output <- cbind(output, signal)
  }

# Save the data in a file
  names(output) <- headers
  if (!headeradded) {
    write.table(output,"output.txt",sep="\t",col.names=TRUE,row.names=FALSE)
    headeradded <- TRUE
  }
  else   
    write.table(output,"output.txt",sep="\t",append = TRUE, col.names=FALSE,row.names=FALSE)
  }

# Summarizing the data by user and by activity
  aggregate(output[,4:1716],by=output[,2:3],mean)

