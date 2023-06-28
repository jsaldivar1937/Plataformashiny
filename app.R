library(shiny)
#install.packages('rsconnect')
#install.packages("shiny.semantic")
library(shiny.semantic)
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
      ")),
    tags$link(
      rel = "stylesheet",
      href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css",
      integrity = "sha384-xNJoULBR9pV+no9MFh+4Mxp8aa6fMTb7WHmbs/ZzOXFcXN6KDd3T0KbTv7+DTk1R",
      crossorigin = "anonymous"
    )
  
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
             tags$h1("Sistema de Informacion Económica para Emprendedores"),
             tags$p("Las diferentes carreras que se
ofrecen a través de las instituciones públicas y privadas del en el estado de
Zacatecas, experimentan una grave situación para poder encontrar trabajo,
dado que nuestro estado adolece de la industrialización, por lo que
muchos de ellos tiene que salir de Zacatecas para por incorporarse a
alguna empresa en los estados vecinos, como los son Aguascalientes,
Jalisco, Nuevo León y la Ciudad de México, principalmente, otros están
logrando ser contratados para trabajos en línea para empresa Americanas y
recientemente Europeas. Sin embargo, existen otros que desean quedarse
para generar nuevas empresas o también llamadas Startups, que apoyen a
las empresas y negocios existentes en el estado, con el objetivo de
potencializar sus productos o servicios."),
             tags$p("SINECE va dirigido para todos aquellos emprendedores inicien la idea de negocio de su
microempresa, requieren de conocer la información económica del estado,
como por ejemplo requieren de saber:"),
             tags$p("¿Qué tipo de industria o comercio existe en Zacatecas?"),
             tags$p(" ¿Qué tipo de negocio o industria es donde se generan más empleos?"),
             tags$p("¿Qué productos o servicios son los que más producen/ofertan?")
             
           
             
             
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

