library(faraway) 
data(worldcup)
library(plotly)
library(ggplot2)

plot_ly(worldcup, type = "scatter",
        x = ~ Time, y = ~ Shots, color = ~ Position)




worldcup %>%
  mutate(Name = rownames(worldcup)) %>%
  plot_ly(x = ~ Time, y = ~ Shots, color = ~ Position) %>%
  add_markers(text = ~ paste("<b>Name:</b> ", Name, "<br />", 
                             "<b>Team:</b> ", Team),
              hoverinfo = "text")


worldcup %>%
  plot_ly(x = ~ Time, y = ~ Shots, z= ~ Passes)%>%add_markers()
head(worldcup)



class(volcano)
a<-volcano[1:4, 1:4]

plot_ly(z = ~ volcano, type = "surface")