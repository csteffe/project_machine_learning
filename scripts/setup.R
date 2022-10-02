#############################################
## The following loads the needed packages ##
#############################################

# load the required packages
packages <- c(
  "here", # for the project's organization
  "tidyverse", "lubridate","questionr","tibble","summarytools","GGally", "fastDummies",
  "reshape", "cluster", "factoextra", "janitor", # for wrangling
  "ggrepel", "gghighlight", "patchwork", "maps", "scales","corrplot", "plotly", # for plotting
  "knitr", "kableExtra", "bookdown", "rmarkdown", "gridExtra", "grid", "sjPlot","sjmisc", "sjlabelled", # for the report
  "ISLR","rpart","rpart.plot","caret","adabag", "FactoMineR", "factoextra"
)
purrr::walk(packages, library, character.only = TRUE)

######################################################
## The following sets a few option for nice reports ##
######################################################

# general options
options(
  digits = 3,
  str = strOptions(strict.width = "cut"),
  width = 69,
  tibble.width = 69,
  cli.unicode = FALSE
)

# ggplot options
theme_set(theme_minimal())

# knitr options
opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  # cache = TRUE,
  fig.retina = 0.8, # figures are either vectors or 300 dpi diagrams
  dpi = 300,
  out.width = "70%",
  fig.align = "center",
  fig.width = 6,
  fig.asp = 0.618,
  fig.show = "hold",
  message = FALSE,
  echo = FALSE
)


#kable options
kable <- function(data, ...) {                                
  knitr::kable(data, 
               booktabs = TRUE, 
               col.names = gsub("[_]", " ",names(data)), ...) %>% 
    kable_styling(bootstrap_options =c("striped", "hover"), 
                  full_width = T, 
                  position = "left", 
                  fixed_thead = T)
}


#to avoid overlapping in x and y axis with ggplotly
layout_ggplotly <- function(gg, x = -0.02, y = -0.08){
  # The 1 and 2 goes into the list that contains the options for the x and y axis labels respectively
  gg[['x']][['layout']][['annotations']][[1]][['y']] <- x
  gg[['x']][['layout']][['annotations']][[2]][['x']] <- y
  gg
}

