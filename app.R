library(shiny)
#install.packages('rsconnect')

rsconnect::setAccountInfo(name='qqqt7y-javier-saldivar', token='1E1571E02BEC3D28BF1994F9984B02E3', secret='/TMEEFeuIkZpeSCsiORHYYBUsL5iYJ9R/0tXYUU2')
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      /* Estilos personalizados */
      body {
        font-family: 'Montserrat', sans-serif;
        background-color: #f8f8f8;
        margin: 0;
        padding: 0;
      }
      .navbar {
        background-color: #333;
        position: fixed;
        top: 0;
        width: 100%;
      }
      .navbar-brand {
        color: #fff;
        font-size: 24px;
        padding: 15px 20px;
      }
      .navbar-toggler {
        border: none;
        outline: none;
        color: #fff;
        font-size: 18px;
        padding: 15px 20px;
        background-color: transparent;
      }
      .navbar-toggler:hover, .navbar-toggler:focus {
        color: #1abc9c;
      }
      .navbar-nav {
        margin-right: 20px;
      }
      .navbar-nav .nav-link {
        color: #fff;
        font-size: 18px;
        padding: 15px 20px;
      }
      .jumbotron {
        background-color: #1abc9c;
        color: #fff;
        padding: 100px 25px;
        margin-top: 70px;
        text-align: center;
      }
      h1 {
        font-size: 48px;
        font-weight: bold;
        margin-top: 0;
      }
      p {
        font-size: 24px;
      }
      .form-inline .form-control {
        width: 350px;
        height: 50px;
        font-size: 18px;
      }
      .form-inline .btn-danger {
        height: 50px;
        font-size: 18px;
      }
      .container-fluid {
        padding: 50px;
      }
      .col-sm-4 {
        text-align: center;
        margin-bottom: 30px;
      }
      h2 {
        font-size: 36px;
        margin-bottom: 20px;
      }
      h4 {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
      }
      "))
  ),
  tags$body(
    tags$nav(class = "navbar navbar-expand-lg navbar-dark",
             tags$a(class = "navbar-brand", "SINECE"),
             tags$button(class = "navbar-toggler", type = "button",
                         tags$span(class = "navbar-toggler-icon")
             ),
             tags$div(class = "collapse navbar-collapse",
                      tags$ul(class = "navbar-nav ml-auto",
                              tags$li(class = "nav-item",
                                      tags$a(class = "nav-link", href = "#about", "Acerca de")
                              ),
                              tags$li(class = "nav-item",
                                      tags$a(class = "nav-link", href = "#values", "Informacion de las Empresas")
                              ),
                              tags$li(class = "nav-item",
                                      tags$a(class = "nav-link", href = "#contact", "Contactanos")
                              )
                      )
             )
    ),
    tags$div(id = "about", class = "jumbotron",
             tags$h1("acerca del proyecto"),
             tags$p("porque surge.")
    ),
    tags$div(id = "values", class = "container-fluid",
             tags$div(class = "row",
                      tags$div(class = "col-sm-4",
                               tags$h2("Aqui van las graficas de la base de datos"),
                               tags$h4("tamaño de su titulo"),
                               tags$p("algo de texto.")
                      )
             )
    ),
    tags$div(id = "contact", class = "jumbotron",
             tags$h1("contacto"),
             tags$p("aqui los contactos")
    )
  )
)

server <- function(input, output) { }

shinyApp(ui = ui, server = server)

