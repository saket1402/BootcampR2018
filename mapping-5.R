library(tigris)
library(sp)

library(ggplot2)
denver_tracts <- tracts(state = "CO", county = 31, cb = TRUE)

class(denver_tracts)

plot(denver_tracts)
a<-bbox(denver_tracts)        #bbox from sp library
class(a)


denver_tracts_df <- fortify(denver_tracts) #(fortify from ggplot)

View(denver_tracts_df)

denver_tracts_df %>%
  dplyr::select(1:4) %>% dplyr::slice(1:5)


denver_tracts_df %>%
  ggplot(aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = "lightblue", color = "black") + 
  theme_void()


#Explore about calculating areas using sp