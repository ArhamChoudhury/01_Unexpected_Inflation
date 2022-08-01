library(ggplot2)
colors <- c("Sepal Width" = "blue", "Petal Length" = "red", "Petal Width" = "orange")

ggplot(iris, aes(x = Sepal.Length)) +
  geom_line(aes(y = Sepal.Width, color = "Sepal Width"), size = 1.5) +
  geom_line(aes(y = Petal.Length, color = "Petal Length"), size = 1.5) +
  geom_line(aes(y = Petal.Width, color = "Petal Width"), size = 1.5) +
  labs(x = "Year",
       y = "(%)",
       color = "Legend") +
  scale_color_manual(values = colors)

colors <- c("Unexpected Inflation" = "gray",
            "Expected Inflation"   = "blue",
            "Actual Inflation"     = "red"
)

chart_3 <- df_1 %>%
  ggplot(aes(x=date)) +
  geom_col(aes(y = `Unexpected Inflation`, color = "gray"), alpha = 0.5) +
  geom_line(aes(y = `Expected Inflation`, color = "Expected Inflation")) +
  geom_line(aes(y = `Actual Inflation`, color = "Actual Inflation")) +
  labs(x = "Year",
       y = "Percent (%)",
       color = "Legend") +
  scale_color_manual(values = colors)
chart_3


library(ggplot2)
library(ggrepel)
library(dplyr)

temp.dat %>%
  mutate(label = if_else(Year == max(Year), as.character(State), NA_character_)) %>%
  ggplot(aes(x = Year, y = Capex, group = State, colour = State)) +
  geom_line() +
  geom_label_repel(aes(label = label),
                   nudge_x = 1,
                   na.rm = TRUE)


chart_4 <- df_1 %>%
  pivot_longer(-date) %>%
  mutate(label = if_else(date == max(date), as.character(name), NA_character_)) %>%
  ggplot(aes(x=date)) +
  geom_col(. %>% filter(name == "Unexpected Inflation"), aes(y = value, color = name)) +
  geom_line(aes(y = `Expected Inflation`, color = "Expected Inflation")) +
  geom_line(aes(y = `Actual Inflation`, color = "Actual Inflation")) +
  labs(x = "Year",
       y = "Percent (%)",
       color = "Legend") +
  scale_color_manual(values = colors)
chart_4

chart_5 <- df_1 %>%
  pivot_longer(-date) %>%
  mutate(label = if_else(date == max(date), as.character(name), NA_character_)) %>%
  ggplot(aes(x= date, y = value, color = name)) +
  geom_line() +
  geom_label_repel(aes(label = label),
                   nudge_x = 1,
                   na.rm = TRUE)
chart_5

p = ggplot(temp.dat) +
  geom_line(aes(x = Year, y = Capex, group = State, colour = State)) +
  geom_text(data = subset(temp.dat, Year == "2014"),
            aes(label = State, colour = State, x = Inf, y = Capex), hjust = -.1) +
  scale_colour_discrete(guide = 'none')  +
  theme(plot.margin = unit(c(1,3,1,1), "lines"))











