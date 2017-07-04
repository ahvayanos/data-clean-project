features <- read.table("features.txt", sep="", header=FALSE, strip.white=TRUE)
activities <- read.table("activity_labels.txt", sep="", header=FALSE, strip.white=TRUE)
  
fileset <- c("test","train")
headeradded <- FALSE

for (whichfile in fileset)
{
  Y <- read.table(paste(whichfile,"/Y_",whichfile,".txt",sep=""), sep="", header=FALSE, strip.white=TRUE, colClasses="numeric")
  X <- read.table(paste(whichfile,"/X_",whichfile,".txt",sep=""), sep="", header=FALSE, strip.white=TRUE, colClasses="numeric")
  subjects <- read.table(paste(whichfile,"/subject_",whichfile,".txt",sep=""), sep="", header=FALSE, strip.white=TRUE, colClasses="numeric")
  
  activityvec <- activities[Y[,1],2]
  
  typevec <- rep(whichfile,times=dim(Y)[1])
  
  output <- cbind(typevec, subjects, activityvec,X)
  headers <- c("Sample-Type","Subject","Activity", as.character(features[[2]]))
  signalset <- dir(paste(whichfile,"/Inertial Signals/",sep=""))
  
  for (whichsignal in signalset) 
  {
    varname = strsplit(dir("test/Inertial Signals/")[1],"_test")[[1]][1]
    
    signal <- read.table(paste(whichfile,"/Inertial Signals/",whichsignal,sep=""), sep="", header=FALSE, strip.white=TRUE, colClasses="numeric")
    
    varnum = seq(from=1,to=128)
    signal_header <- paste(rep(varname,times=128),varnum,sep="_")
    
    headers <- c(headers,signal_header)
    output <- cbind(output, signal)
  }

  names(output) <- headers
  if (!headeradded) {
    write.table(output[1:100,],"output.txt",sep="\t",col.names=TRUE,row.names=FALSE)
    headeradded <- TRUE
  }
  else   
    write.table(output[1:100,],"output.txt",sep="\t",append = TRUE, col.names=FALSE,row.names=FALSE)
  }

  aggregate(output[,4:1716],by=output[,2:3],mean)

