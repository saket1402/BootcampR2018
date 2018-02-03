get_map("Baltimore County", zoom = 10, 
        source = "stamen", maptype = "toner") %>%
  ggmap() + 
  geom_polygon(data = baltimore, aes(x = long, y = lat, group = group),
               color = "navy", fill = "lightblue", alpha = 0.2) + 
  geom_point(data = serial, aes(x = long, y = lat, color = tower)) + 
  theme_void() + 
  scale_color_manual(name = "Cell tower", values = c("black", "red"))

geocode("Supreme Court of the United States")

geocode("1 First St NE, Washington, DC")


mapdist("Baltimore, MD",
        "1 First St NE, Washington, DC") %>%
  select(from, to, miles)

mapdi