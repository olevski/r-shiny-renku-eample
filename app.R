library(shiny)
library(bslib)


# Get Host/Port from env, or use defaults
# Defaulting to 0.0.0.0 is best for Docker/External access
APP_HOST <- Sys.getenv("RENKU_SESSION_IP", "0.0.0.0")
APP_PORT <- as.numeric(Sys.getenv("RENKU_SESSION_PORT", 8080))

# --- 2. UI ---

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  # App title ----
  title = "Hello Shiny!",
  # Sidebar panel for inputs ----
  sidebar = sidebar(
    # Input: Slider for the number of bins ----
    sliderInput(
      inputId = "bins",
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 30
    )
  ),
  # Output: Histogram ----
  plotOutput(outputId = "distPlot")
)


# Define server logic required to draw a histogram ----
server <- function(input, output) {

  output$distPlot <- renderPlot({

    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(x, breaks = bins, col = "#007bc2", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")

    })

}

# --- 4. RUN THE APP ---
# We pass the 'options' list here. 
# This tells Shiny exactly how to launch when this file is run.
shinyApp(
  ui = ui, 
  server = server,
  options = list(
    host = APP_HOST, 
    port = APP_PORT
  )
)
