library(ggmap)
library(dplyr)
beijing <- get_map("Beijing", zoom = 12)
ggmap(beijing)


ggmap(beijing) + 
  theme_void() + 
  ggtitle("Beijing, China")


map_1 <- get_map("Estes Park", zoom = 12,
                 source = "google", maptype = "terrain") %>%
  ggmap(extent = "device")



map_2 <- get_map("Estes Park", zoom = 12,
                 source = "stamen", maptype = "watercolor") %>%
  ggmap(extent = "device")

map_3 <- get_map("Estes Park", zoom = 12,
                 source = "google", maptype = "hybrid") %>%
  ggmap(extent = "device")

library(gridExtra)
grid.arrange(map_1, map_2, map_3, nrow = 1)


get_map(c(2.35, 48.86), zoom = 10) %>%
  ggmap(extent = "device")

