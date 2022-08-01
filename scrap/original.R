library(tidyverse)
library(tidyquant)
library(timetk)
library(scales)


'T5YIE' %>%
  tq_get(get= "economic.data", from = "2003-01-01") %>%
  mutate(Percent = price/100) %>%
  summarise_by_time(
    .date_var = date,
    .by = "month",
    expected_five_year = mean(Percent, na.rm = T)
  ) %>%
  left_join(
    "CPIAUCSL" %>%
      tq_get(get= "economic.data", from = "1998-01-01") %>%
      select(date, cpi = price) %>%
      mutate(
        cpi_5_year_change = cpi/lag(cpi, 60) - 1,
        cpi_five_year_avg = cpi_5_year_change/5
      ) %>%
      filter( date >= "2003-01-01")
  ) %>%
  select(date, contains("five")) %>%
  mutate(
    actual_five_year = lead(cpi_five_year_avg, 60),
    unexpected_five_year = actual_five_year - expected_five_year) %>%
  drop_na() %>%
  select(-contains("cpi")) %>%
  pivot_longer(-date) %>%

  mutate(name = str_replace(name, "_five_year", " inflation") %>% str_to_title()) %>%
  ggplot(aes(x = date, y = value, color = name)) +
  geom_line() +
  scale_y_continuous(labels = percent, breaks = pretty_breaks(10)) +
  scale_x_date(date_breaks = "2 year",
               date_labels = "%Y") +
  theme_minimal() +
  labs(x = "", y = "", color = "",
       title = "Actual, Expected and Unexpected Inflation: Next 5 Years",
       caption = "Source: Fred data. Based on CPI and 5-Year Breakeven Rates") +
  theme(legend.position = "top",
        plot.title =element_text(hjust = .5))
