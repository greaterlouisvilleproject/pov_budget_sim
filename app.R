#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


#divide everything by 12 to do monthly costs
#tell what the living wage is
#use a % of the living wage # (80% and 60% ??)

# food_ann <- 8888
# child_care_ann <- 10793
# medical_ann <- 5634
# housing_ann <- 9804
# transit_ann <- 11911
# other_ann <- 6010
# 
# food_mon <- food_ann/12
# child_care_mon <- child_care_ann/12
# medical_mon <- medical_ann/12
# housing_mon <- housing_ann/12
# transit_mon <- transit_ann/12
# other_mon <- other_ann/12



library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel(img(src = "glp_logo.jpg")),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      mainPanel(
          p("Imagine you are budgeting for a family of four in Louisville. Although you are in poverty, 
            you are as well off as a poor person can be, earning just under the poverty line for a 
            family of four, $24,600."),
          p("Estimates for the cost of living are for Jefferson County, KY, and 
            come from MIT's living wage calculator. MIT estimates that a living wage for a family of
            four in Jefferson County is $63,156 before taxes, or $53,040. Since the living wage is 
            a measure of what a decent living would cost, for all budget categories the top line is
            the cost estimate from MIT for a decent living in each category."),
         radioButtons("housing",
                     "Monthly Housing Costs: ",
                     choices = list("Studio Apartment ($551)" = 551, 
                                    "2 Bedroom Apartment ($793)" = 793, 
                                    "3 Bedroom Apartment ($1085)" = 1085)),
         radioButtons("food",
                      "Monthly Food Costs: ",
                      choices = list("One meal a day ($247)" = 247, 
                                     "Two meals a day ($494)" = 494, 
                                     "Three meals a day ($741)" = 741)),
         radioButtons("child_care",
                      "Monthly Child Care Costs: ",
                      choices = list("Older kid takes care of younger ($0)" = 0, 
                                     "Informal Homebased ($800)" = 800, 
                                     "Child Care Center ($1300)" = 1300)),
         radioButtons("medical",
                      "Monthly Medical Costs: ",
                      choices = list("No insurace, pay costs yourself ($157)" = 157, 
                                     "Insurance through work but not for dependents ($313)" = 313, 
                                     "Whole family insured ($470)" = 470)),
         radioButtons("transit",
                      "Monthly Transit Costs: ",
                      choices = list("2 TARC Bus Passes ($100)" = 100, 
                                     "1 used car ($309)" = 309, 
                                     "2 used cars ($618)" = 618)),
         radioButtons("tech and entertainment",
                      "Monthly Technology Costs: ",
                      choices = list("Landline or prepaid phone, over the air TV ($15)" = 15, 
                                     "Landline, Internet, Cable TV ($90)" = 90, 
                                     "Cell Phones, Internet, Cable TV ($90)" = 210)),
         radioButtons("other",
                      "Monthly Other Costs: ",
                      choices = list("Very little ($167)" = 167, 
                                     "Some other needs ($334)" = 334, 
                                     "Basic other needs ($501)" = 501))
      ),
    
      
      sidebarPanel(
         textOutput("budget_left")
      )
   ) 
)


server <- function(input, output) {
   
   # output$housing_selection <- renderText({
   #   if(input$housing == 5500) {house_var <- "Unstable Housing"}
   #   if(input$housing == 7500) {house_var <- "Poor Housing"}
   #   if(input$housing == 9804) {house_var <- "Decent Housing"}
   #   text_out <- paste("You have selected", house_var)
   #   text_out
   # })
   # output$food_selection <- renderText({
   #   if(input$food == 5500) {food_var <- "Not Enough Food"}
   #   if(input$food == 7000) {food_var <- "Poor Quality Food"}
   #   if(input$food == 8888) {food_var <- "Decent Quality Food"}
   #   text_out <- paste("You have selected", food_var)
   #   text_out
   # })
   output$budget_left <- renderText({
     budget_num <- 2050 - as.numeric(input$housing) - as.numeric(input$food) - as.numeric(input$child_care) -
       as.numeric(input$medical) - as.numeric(input$transit) - as.numeric(input$other)
     budget_text <- paste("You have", budget_num, "dollars remaining")
     budget_text
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

