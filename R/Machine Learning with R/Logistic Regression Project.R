# Logistic Regression
adult <- read.csv("adult_sal.csv")
head(adult)

library(dplyr)
adult <- select(adult, -X)
head(adult)
str(adult)
summary(adult)

# How many null employers are there
table(adult$type_employer)

## Data Cleaning and Feature Engineering

# Combine employer types
unemp <- function(job){
  job <- as.character(job)
  
  if (job=="Never-worked" | job=="Without-pay"){
    return("Unemployed")
  }else{
    return(job)
  }
}

adult$type_employer <-sapply(adult$type_employer, unemp)
table(adult$type_employer)

group_emp <- function(job){
  if (job=='Local-gov' | job=='State-gov'){
    return('SL-gov')
  }else if (job=='Self-emp-inc' | job=='Self-emp-not-inc'){
    return('self-emp')
  }else{
    return(job)
  }
}

# Combine employer types
adult$type_employer <- sapply(adult$type_employer,group_emp)
table(adult$type_employer)

# Marital Status
table(adult$marital)

# Reduce this to three basic troups: Married, not married, never married
group_marital <- function(mar){
  mar <- as.character(mar)
  
  # Not-Married
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
    
    # Never-Married   
  }else if(mar=='Never-married'){
    return(mar)
    
    #Married
  }else{
    return('Married')
  }
}

adult$marital <- sapply(adult$marital,group_marital)
table(adult$marital)

head(adult, 3)

# Country column
table(adult$country)

# Group countries
Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')

North.America <- c('Canada','United-States','Puerto-Rico' )

Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')

Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')


group_country <- function(ctry){
  if (ctry %in% Asia){
    return('Asia')
  }else if (ctry %in% North.America){
    return('North.America')
  }else if (ctry %in% Europe){
    return('Europe')
  }else if (ctry %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')      
  }
}


adult$country <- sapply(adult$country,group_country)
table(adult$country)

adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)


str(adult)
















