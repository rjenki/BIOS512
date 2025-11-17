library(shiny)
library(tidyverse)
library(plotly)

pows <- read_csv("derived_data/character_powers.csv")
powers <- pows$name %>% unique()
pows <- pows %>% filter(value == 1)

chars <- read_csv("derived_data/character_properties.csv")
props <- chars$name %>% unique()

interesting_properties <- c(
  "affiliation",
  "alignment",
  "citizenship",
  "marital status",
  "occupation",
  "gender",
  "eyes",
  "hair",
  "creators",
  "base_of_operations",
  "skin",
  "race",
  "status"
)

chars <- chars %>% filter(value != "!missing!")

property_counts <- chars %>% group_by(name, value) %>% tally()

# collapse rare levels per property
chars <- chars %>%
  inner_join(property_counts, by = c("name", "value")) %>%
  group_by(name) %>%
  mutate(value = ifelse(n < 70, "other", value)) %>%
  ungroup() %>%
  select(-n)

emb <- read_csv("derived_data/character_embedding.csv")

ui <- fluidPage(
  titlePanel("Comic Character Explorer"),
  sidebarLayout(
    sidebarPanel(
      selectizeInput(
        inputId = "power",
        label = "Power",
        choices = powers,
        multiple = FALSE
      ),
      selectizeInput(
        inputId = "property",
        label = "Property",
        choices = interesting_properties,
        multiple = FALSE
      )
    ),
    mainPanel(
      plotlyOutput("graph")
    )
  )
)

server <- function(input, output, session) {
  
  output$graph <- renderPlotly({
    req(input$power, input$property)
    
    selected_power <- input$power
    selected_property <- input$property
    
    # All characters that have the selected power
    power_rows <- pows %>%
      filter(name == selected_power, value == 1)
    
    # All characters that have the selected property (any value)
    chars_ss <- chars %>%
      filter(name == selected_property)
    
    # Join embeddings
    emb_ex <- emb %>%
      left_join(chars_ss, by = "character")
    
    # Replace missing property values so Plotly doesn't choke
    emb_ex$value[is.na(emb_ex$value)] <- "Unknown"
    
    plt <- ggplot(
      emb_ex,
      aes(x, y, text = character)
    ) +
      geom_point(aes(
        size = character %in% power_rows$character,
        color = factor(value)
      )) +
      scale_size_manual(values = c(`TRUE` = 1.4, `FALSE` = 0.6)) +
      labs(size = "Has Power", color = "Property")
    
    ggplotly(plt, tooltip = "text")
  })
}

shinyApp(
  ui = ui,
  server = server,
  options = list(port = 8880, host = "0.0.0.0")
)