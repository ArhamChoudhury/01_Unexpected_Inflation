library(plotly)
data <- data.frame(
  X = c (0, 1, 2, 3, 4, 5),
  Line = c(1.5, 1, 1.3, 0.7, 0.8, 0.9),
  Bar = c(1, 0.5, 0.7, -1.2, 0.3, 0.4))
data

fig <- plot_ly(data, x = ~X, y = ~Bar, type = 'bar') %>%
  add_trace(data , x = ~X, y = ~Line, type = 'scatter',  mode = 'lines+markers')
fig

nticks=33

# explanation of dticks
# so source: https://community.plotly.com/t/date-formatting-fro-x-axis-ticks/33374



# end
