library(shiny)
data("mtcars")
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    ifelse(input$cyl,i<-1,i<-0)
    ifelse(input$gear,j<-1,j<-0)
    ifelse(input$carb,k<-1,k<-0)
    ifelse(i+j+k>1,par(mfrow = c(i+j+k, 1),mar = c(1+2*(i+j+k), 1+2*(i+j+k), 2, 1)),par(mfrow = c(1, 1),mar = c(4, 4, 2, 1)))
    ifelse(input$cyl, boxplot(mpg~cyl,data=mtcars, main="Box Plot", xlab="Number of Cylinders", ylab="Miles Per Gallon"), "") 
    ifelse(input$gear, boxplot(mpg~gear,data=mtcars, main="Box Plot", xlab="Number of Forward Gears", ylab="Miles Per Gallon"), "") 
    ifelse(input$carb, boxplot(mpg~carb,data=mtcars, main="Box Plot", xlab="Number of Carburetors", ylab="Miles Per Gallon"), "") 
  })
  output$value<-renderText({
    ifelse(input$cyl,i<-1,i<-0)
    ifelse(input$cyl,i1<-input$cylno,i1<-0)
    ifelse(input$gear,j<-1,j<-0)
    ifelse(input$gear,j1<-input$gearno,j1<-0)
    ifelse(input$carb,k<-1,k<-0)
    ifelse(input$carb,k1<-input$carbno,k1<-0)
    if(i==1&&j==0&&k==0){
      y<-lm(mpg ~ cyl, data=mtcars)
      y1<-predict(y, newdata=data.frame(cyl=i1))
    }
    if(i==1&&j==1&&k==0){
      y<-lm(mpg ~ cyl+gear, data=mtcars)
      y1<-predict(y, newdata=data.frame(cyl=i1,gear=j1))
    }
    if(i==1&&j==1&&k==1){
      y<-lm(mpg ~ cyl+gear+carb, data=mtcars)
      y1<-predict(y, newdata=data.frame(cyl=i1,gear=j1,carb=k1))
    }
    if(i==0&&j==1&&k==1){
      y<-lm(mpg ~ gear+carb, data=mtcars)
      y1<-predict(y, newdata=data.frame(gear=j1,carb=k1))
    }
    if(i==0&&j==1&&k==0){
      y<-lm(mpg ~ gear, data=mtcars)
      y1<-predict(y, newdata=data.frame(gear=j1))
    }
    if(i==0&&j==0&&k==1){
      y<-lm(mpg ~ carb, data=mtcars)
      y1<-predict(y, newdata=data.frame(carb=k1))
    }
    if(i==0&&j==0&&k==0){
      y1<-0
    }
    return(y1)
  })
})