

#creating a function to clean the dataset
readStates<-function(states){
#removing first row
states<-states[-1,]
#counting number of rows
num.row<-nrow(states)
#removing last row
states<-states[-num.row,]
#removing columns 1 to 4
states<-states[,-1:-4]
#changing column names
colnames(states)<-c("stateName","population","popOver18","percentOver18")
return(states)
}
#retured clean dataset 
cleanCensus<-readStates(raw_data)
#structure of cleaned dataset
str(cleanCensus) 
