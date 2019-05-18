#Que.1.create histogram for all the variables of mtcars
library(purrr)
library(tidyr)
library(ggplot2)

mtcars %>%
  keep(is.numeric) %>% 
  gather() %>% 
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram()

#Check the probability distribution of all variables in mtcars

plots<- list()
cars<- rownames(mtcars)
columnName<- colnames(mtcars)
par(mfrow = c(3,4))
for(i in 1:ncol(mtcars))
  local({
    i <- i
    tempVect <-  mtcars[,i]
    names(tempVect) <- cars
    p1<- ggplot(mtcars,aes(x = mtcars[,i]))+geom_density(fill='lightblue')
    plots[[i]] <<- p1
    p1
  })




#Que.3.create boxplot for all the variables
boxplot(mtcars$mpg, mtcars$cyl, mtcars$disp, mtcars$hp, mtcars$drat, mtcars$wt, mtcars$qsec, 
        mtcars$vs, mtcars$am, mtcars$gear, mtcars$carb, 
        main = "multiple boxplot", at = c(1,2,3,4,5,6,7,8,9,10,11), 
        names = c("mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"), 
        col = heat.colors(5),horizontal = FALSE,notch = TRUE)
