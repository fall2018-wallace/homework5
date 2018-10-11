
#load ggplot2
library(ggplot2)
#plotting histgram of population with specifying color,fill and binwidth
hist1<-ggplot(final_df,aes(x=population)) +
  geom_histogram(color="black",fill="red",bins=20)
  
#plotting histogram of Murder rate with specifying color,fill and binwidth
hist2<-ggplot(final_df,aes(x=Murder)) +
  geom_histogram(color="black",fill="red",bins=20)
  
#Plotting histogram of Assault with specifying color,fill and binwidth 
hist3<-ggplot(final_df,aes(x=Assault)) +
  geom_histogram(color="black",fill="red",bins=20)
 
#plotting histogram of UrbanPopulation with specifying color,fill and binwidth
hist4<-ggplot(final_df,aes(x=UrbanPop)) +
  geom_histogram(color="black",fill="red",bins=20)
 
#Plotting histogram of Rape with specifying color,fill and binwidth
hist5<-ggplot(final_df,aes(x=Rape)) +
  geom_histogram(color="black",fill="red",bins=20)

#plotting boxplot of population
box1<-ggplot(final_df,aes(y=population,x=factor(0))) +
       geom_boxplot()

#plotting boxplot of murder rate
box2<-ggplot(final_df,aes(y=Murder,x=factor(0))) +
       geom_boxplot()

       
# I think which visualisation is important depends on what type of analysis you want to do.
#Since both the plots focus on different areas like histogram states frequency distribution,i.e.,
# how often each value in the data set occur(total count)
#while box plot gives information about quartiles, median, outliers etc. 

# calculating number of murders per state and adding the vector to already existing dataset
final_df$murder_state<- (final_df$Murder/100000)*final_df$population

#printing final_df
final_df

#plotting barchart with number of murders per state using geom_col function
bar1<-ggplot(final_df,aes(x=stateName,y=murder_state)) +
       geom_col() +
       scale_y_continuous("Number of murders per state")
       
#plotting the same barchart as previous one but with rotation of x axis texts
bar2<-ggplot(final_df,aes(x=stateName,y=murder_state)) +
       geom_col() + theme(axis.text.x=element_text(angle=90,hjust=1))+
       scale_y_continuous("Number of murders per state") +
       ggtitle("Total Murders") 
       
#plotting the same barchart as previous one but with sorting the x axis with murder rate
bar3<-ggplot(final_df,aes(x=reorder(stateName,Murder),y=murder_state)) +
       geom_col() + theme(axis.text.x=element_text(angle=90,hjust=1))+
       labs(x="StateName",y="Number of murders per state")+
       ggtitle("Total Murders")
       
#same as previous but showing percentOver18 as fill color
bar4<-ggplot(final_df,aes(x=reorder(stateName,Murder),y=murder_state,fill=percentOver18)) +
       geom_col() + theme(axis.text.x=element_text(angle=90,hjust=1))+
       labs(x="StateName",y="Number of murders per state")+
       ggtitle("Total Murders")

#plotting scatter plot       
scatter1<-ggplot(final_df,aes(x=population,y=percentOver18)) +
        geom_point(aes(size=Murder,color=Murder))

       
