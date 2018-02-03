data(votes.repub)
head(votes.repub)


library(dplyr)
library(viridis)

#Using Virdis library for color pallette
votes.repub %>%
  tbl_df() %>%
  mutate(state = rownames(votes.repub),
         state = tolower(state)) %>%
  right_join(us_map, by = c("state" = "region")) %>%
  ggplot(aes(x = long, y = lat, group = group, fill = `1976`)) +
  geom_polygon(color = "black") + 
  theme_void() + 
  scale_fill_viridis(name = "Republican/nvotes (%)")



library(ggplot2)


maryland <- map_data('county', region = 'maryland')
head(maryland)


baltimore <- maryland %>%
  filter(subregion %in% c("baltimore city", "baltimore"))
head(baltimore, 3)


ggplot(baltimore, aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = "lightblue", color = "black") + 
  theme_void()



serial <- read.csv("G:/Bootcamp R/Mapping in R/serial_map_data.csv")
head(serial, 3)

View(serial)
serial <- serial %>%
  mutate(long = -76.8854 + 0.00017022 * x,
         lat  = 39.23822 + 1.371014e-04 * y,
         tower = Type == "cell-site")

View(serial)


ggplot(baltimore, aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = "lightblue", color = "black") + 
  geom_point(data = serial, aes(group = NULL, color = tower)) + 
  theme_void() + 
  scale_color_manual(name = "Cell tower", values = c("black", "red"))