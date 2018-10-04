
##clean_data <- raw_data
readStates <- function(states){
    states <- states[-1,]
    
    num.row<- nrow(states)
    states<- states[-num.row,]
}
