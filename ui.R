require(shiny)


shinyUI(pageWithSidebar(
  headerPanel(title = 'Microsoft Cognitive Services:Computer Vision API'
           ),
  
  sidebarPanel(
      tabsetPanel(
      id = "tabs",
      tabPanel(
        "URL Input",
        textInput("url", "Image URL:", "https://pbs.twimg.com/media/C0w3Jw1XgAA14to.jpg:large"),
        helpText("Please input image URL of your choice so that Microsoft Computer Vision algorithms can analyze the image."),
        actionButton("goButton", "RUN")
      )
    )
  ),
  
  mainPanel(
    h3("Image"),
    hr(),
    
    uiOutput("image"),
    hr(),
    
    h3("Content Description:"),
    textOutput("res")
    
  )
))