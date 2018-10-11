

#load ggplot2
library(ggplot2)
#plotting histgram of population with specifying color,fill and binwidth
plot1<-ggplot(df_final,aes(x=population)) +
  geom_histogram(color="black",fill="red",bin=20)
  
#plotting histogram of Murder rate with specifying color,fill and binwidth
plot2<-ggplot(df_final,aes(x=Murder)) +
  geom_histogram(color="black",fill="red",bin=20)
  
#Plotting histogram of Assault with specifying color,fill and binwidth 
plot3<-ggplot(df_final,aes(x=Assault)) +
  geom_histogram(color="black",fill="red",bin=20)
 
#plotting histogram of UrbanPopulation with specifying color,fill and binwidth
plot4<-ggplot(df_final,aes(x=UrbanPop)) +
  geom_histogram(color="black",fill="red",bin=20)
 
#Plotting histogram of Rape with specifying color,fill and binwidth
plot5<-ggplot(df_final,aes(x=Rape)) +
  geom_histogram(color="black",fill="red",bin=20)

#plotting boxplot of population
plot6<-ggplot(df_final,aes(y=population,x=factor(0))) +
       geom_boxplot()

#plotting boxplot of murder rate
plot7<-ggplot(df_final,aes(y=Murder,x=factor(0))) +
       geom_boxplot()

       
# I think which visualisation is important depends on what type of analysis you want to do.
#Since both the plots focus on different areas like histogram states frequency distribution,i.e.,
# how often each value in the data set occur(total count)
#while box plot gives information about quartiles, median, outliers etc. 

# calculating number of murders per state and adding the vector to already existing dataset
df_final$murder_state<- (df_final$Murder/100000)*df_final$population

#printing df_final
df_final

#plotting barchart with number of murders per state using geom_col function
plot8<-ggplot(df_final,aes(x=stateName,y=murder_state)) +
       geom_col() +
       scale_y_continuous("Number of murders per state")
       
#plotting the same barchart as previous one but with rotation of x axis texts
plot9<-ggplot(df_final,aes(x=stateName,y=murder_state)) +
       geom_col() + theme(axis.text.x=element_text(angle=90,hjust=1))+
       scale_y_continuous("Number of murders per state") +
       ggtitle("Total Murders") 
       
#plotting the same barchart as previous one but with sorting the x axis with murder rate
plot10<-ggplot(df_final,aes(x=reorder(stateName,Murder),y=murder_state)) +
       geom_col() + theme(axis.text.x=element_text(angle=90,hjust=1))+
       labs(x="StateName",y="Number of murders per state")+
       ggtitle("Total Murders")
       
#same as previous but showing percentOver18 as fill color
plot11<-ggplot(df_final,aes(x=reorder(stateName,Murder),y=murder_state,fill=percentOver18)) +
       geom_col() + theme(axis.text.x=element_text(angle=90,hjust=1))+
       labs(x="StateName",y="Number of murders per state")+
       ggtitle("Total Murders")

#plotting scatter plot       
plot12<-ggplot(df_final,aes(x=population,y=percentOver18)) +
        geom_point(aes(size=Murder,color=Murder))
