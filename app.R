library(shiny)
#install.packages('rsconnect')
#install.packages("shiny.semantic")
#install.packages("leaflet")
library(shiny.semantic)
library(tidytext)
library(tidyverse)
library(stringr)
library(dplyr)
library(DT)
library(ggplot2)
library(readr)

df <- read.csv("Cuantificar.csv")
data <- read_csv("denue_inegi_32_.csv")
codigo_actividad <- read_csv("tc_codigo_actividad.csv")
gastos <- read_csv("gastos.csv")



empresas <- length(unique(data$nom_estab))
#datos_combinados <- merge(data, codigo_actividad, by = "CODIGO")
#datos_procesados <- datos_combinados %>%
 # mutate(grupo = word(DESC_CODIGO, 1)) %>%
  #group_by(grupo) %>%
  #summarise(total = n())
datos_procesados <- data %>%
  mutate(grupo = word(nom_estab, 1)) %>%
  group_by(grupo) %>%
  summarise(total = n())


top_10_actividades <- datos_procesados %>%
  group_by(grupo) %>%
  summarise(total = sum(total)) %>%
  top_n(10, total) %>%
  arrange(desc(total))







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
            
            
            
    tags$div(
      id = "values",
      tags$div(
        class = "row",
        tags$div(
          class = "col-sm-6 d-flex justify-content-center container-fluid",
          tags$h2("Empresas en México"),
          tags$h4("Se muestra el número total de empresas en México según el censo 2022 por el INEGI."),
          tags$div(
            class = "container-fluid",
            style = "display: flex; justify-content: center; align-items: center; background-color: white; border: 2px solid green; color: #000; width: 250px; height: 250px; border-radius: 100%;",
            tags$p(
              style = "font-size: 36px; font-weight: bold; margin: 0;",
              empresas # Reemplaza "5000" con el número real de empresas en México
            )
          )
          
        ),
        tags$div(
          class = "col-sm-6",
          tags$h2("Empresas mas populares"),
          tags$h4("En el siguiente gráfico se muestran las principales actividades realizadas."),
          tags$div(
            class = "container-fluid",
            id = "grafica_pie",
            plotOutput("grafica_pie")
          )
        ),
        tags$div(
          #class = "col-sm-8",
          tags$h2("Gastos del Gobierno de Zacatecas"),
          tags$h4("A continuación se muestran las inversiones del gobierno en el estado apoyando diversos sectores."),
          tags$div(
            class = "container-fluid",
            id = "grafica_pie2",
            plotOutput("grafica_pie2")
          )
        ),
      )
    ),
    
    
    tags$div(
      id ="values",
      class= "container-fluid",
      tags$h2("Filtro de Comercios en el Estado de Zacatecas."),
      DT::dataTableOutput("tabla_resultados")
    ),
    tags$div(
      id ="values",
      class= "container-fluid",
      plotOutput("grafica_empresas")
    ),
  
    
    tags$div(id = "contact", class = "jumbotron",
             tags$h1("Contacto"),
             
             tags$div(
               class= "row",
               tags$div(
                 class = "col-sm-3",
                 tags$h3("Luis Zapata"),
                 tags$p("lzapata@utzac.edu.mx")
                 
               ),
               tags$div(
                 class = "col-sm-3",
                 tags$h3("Rubén Delgado"),
                 tags$p("ruben.dc@gmail.com")
                 
               ),
               tags$div(
                 class = "col-sm-3",
                 tags$h3("Fernando Araiz"),
                 tags$p("Lf.fercho@gmail.com")
                 
               ),
               tags$div(
                 class = "col-sm-3",
                 tags$h3("Javier Saldivar"),
                 tags$p("javiersaldivar28@gmail.com")
                 
               )
               
             ),
             
    )
  )
)

server <- function(input, output) {
  
  
  output$grafica_pie <- renderPlot({
    
    # Crear el gráfico de pastel
    pie_chart <- ggplot(top_10_actividades, aes(x = "", y = total, fill = grupo)) +
      geom_bar(width = 1, stat = "identity") +
      coord_polar("y", start = 0) +
      theme_void() +
      labs(fill = "grupo")
    
    # Mostrar el gráfico de pastel
    print(pie_chart)
  })
  datos_procesados$grupo <- iconv(datos_procesados$grupo, to = "UTF-8", sub = "//TRANSLIT")
  
  output$tabla_resultados <- DT::renderDataTable({
    DT::datatable(
      datos_procesados,
      options = list(
        pageLength = 10,  # Número de filas por página
        lengthMenu = c(10, 25, 50),  # Opciones de selección de filas por página
        searching = TRUE  # Habilitar la búsqueda en la tabla
      ),
      rownames = FALSE  # Para evitar mostrar la columna de números de fila
    )
  })
  
  output$grafica_empresas <- renderPlot({
    ggplot(df, aes(x = ACTIVIDAD, y = EMPRESAS, fill = EMPRESAS)) +
      geom_bar(stat = "identity") +
      coord_flip() +
      labs(
        x = "Actividad Económica",
        y = "Número de Empresas",
        title = "Empresas por Actividad Económica en Zacatecas"
      ) 
  })
  
  output$grafica_pie2 <- renderPlot({
    
    # Crear el gráfico de pastel
    pie_chart2 <- ggplot(gastos, aes(x = "", y = Cantidad, fill = Concepto)) +
      geom_bar(width = 1, stat = "identity") +
      coord_polar("y", start = 0) +
      theme_void() +
      labs(fill = "Concepto")
    
    # Mostrar el gráfico de pastel
    print(pie_chart2)
  })
  
}

shinyApp(ui = ui, server = server)

#
#ggplot(df, aes(x = ACTIVIDAD, y = EMPRESAS, fill=EMPRESAS) )+    # geom_bar works fine
 # ylab("NUMERO DE EMPRESAS")+ geom_bar(stat = "identity") +
  #coord_flip() + ggtitle("Empresas por Actividad Economica en Zacatecas")

#agrupado <- aggregate(valor ~ actividad, data = datos_combinados, FUN = sum)

#agrupamientos
#palabras_clave <- datos_combinados %>%
 # unnest_tokens(palabra, DESC_CODIGO) %>%
#  count(palabra, sort = TRUE) %>%
 # filter(n > 1) %>%
  #pull(palabra)

#datos_combinados <- datos_combinados %>%
 # mutate(grupo = case_when(
  #  str_detect(DESC_CODIGO, paste(palabras_clave, collapse = "|")) ~ DESC_CODIGO,
   # TRUE ~ "Otro"
  #))
#agrupamientos primera palabra

#datos_combinados <- datos_combinados %>%
 # mutate(grupo = word(DESC_CODIGO, 1))
         
#agrupado <- datos_combinados %>%
 # group_by(grupo) %>%
  #summarise(total_filas = n())         

#agrupado <- datos_combinados %>%
 # group_by(grupo) %>%
#  count() %>%
 # rename(total_valor = n)
