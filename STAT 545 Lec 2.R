# LEC 2: R EXPLORATION
#first assignment is due on Sept 17
#need to make a HW repository
#R is one of the top 2 languages for data analysis
#use R script instead of R so you can save your script; analysis cannot be saved in a console
#R saves history but do not rely on it
#env't has everything created in that analysis
#= is similar to <-
#order of things do not matter but order of execution matters; ideally want to write top to bottom
#can save console output in history

#VECTORS
#storing a new variable requires execution
#c always means vector
#vector action allows the looping to perform action on all members

times<-c(60,33,20,55,15,65,30)
times/60
#to express time in hr instead of min:
times<-(times/60)
times
times<-times*60

#COMPARISONS
#can use <, == (is equal to), != (is not equal to), or | (or)
#value given is T/F

times<20

times==30

times!=25

?Comparison

#can use & to join values:
#2 trues =T, otherwise=F

times>20 & times<50

which(times<30)
any(times<30)

times

#when operation on T/F, gives T=1 and F=0
#can add comments with #

a=all(times>30)

#SUBSETTING
times[3] #gives the 3rd entry
times[-3] #gives the vector values -3??
times[c(2,4)] #gives the 2nd and 4th values; if w/o the [] then it will assume you are asking for the 2nd row and the 5th column
#can highlight the code you want to run
#: can be used to construct sequential vectors

times[times<30]

#capping

times[times>50]<-50 #makes values >50 become =50 and when you run times, it will not be reflected

times

#NA
#is used to show missing data
times[8]<-NA
times
mean(times)

#FNCS Pt II
#?mean gives documentation for the mean
?mean #mean(x, trim = 0, na.rm = FALSE, ...)
#... can pass other arguments
#argument is what the arguments are for
#=0 means that that argument has a default value if you do not set it
#na.rm
#can use:

mean(times,trm=0, na.rm=TRUE)
mean(x=times,na.rm=TRUE) #using argument=value
mean(times,0,TRUE) #just value

#trm takes out the outer values for a robust stats

#DATAFRAMES
mtcars #dataset with equal number of vectors; can get info about mtcars w/o displayingthe data
str(mtcars)
names(mtcars)
#can extract column/vector via $:
mtcars$mpg

#TBL
#takes dataframe and adds bells and whistles

#anything not done in class is not required to be done but participation should reflect what was done in class

#can save env't byt not a good habit
#x restore.RData into...