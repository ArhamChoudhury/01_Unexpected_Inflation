library(patchwork)
library(ggplot2)
p1 <- ggplot(mtcars) +
  geom_point(aes(mpg, disp)) +
  ggtitle('Plot 1')

p2 <- ggplot(mtcars) +
  geom_boxplot(aes(gear, disp, group = gear)) +
  ggtitle('Plot 2')
p2

p3 <- ggplot(mtcars) +
  geom_point(aes(hp, wt, colour = mpg)) +
  ggtitle('Plot 3')

p3a <- ggplot(mtcars) +
  geom_point(aes(gear, wt, colour = mpg)) +
  ggtitle('Plot 3a')
p3a

p4 <- ggplot(mtcars) +
  geom_bar(aes(gear)) +
  facet_wrap(~cyl) +
  ggtitle('Plot 4')


p1 + p2

p1 + p2 + labs(subtitle = 'This will appear in the last plot')

p1 + p2 + p3 + p4

p1 + p2 + p3 + p4 + plot_layout(nrow = 3, byrow = FALSE)

p2 + p3a + plot_layout(nrow = 2, byrow = FALSE)

p1 / p2

p1 | p2

p1 | (p2 / p3)




chart_1 <- df_1 %>%
  ggplot(aes(x=date)) +
  geom_col(aes(y = `Unexpected Inflation`), color = "gray", alpha = 0.5) +
  geom_line(aes(y = `Expected Inflation`, color = "a")) +
  geom_line(aes(y = `Actual Inflation`, color = "b")) +
  scale_color_manual(name = "Legend",
                     values = c("Inflation" = "red",
                                "b" = "blue"))
chart_1


chart_2 <- df_1 %>%
  ggplot(aes(x=date)) +
  geom_col(aes(y = `Unexpected Inflation`), color = "gray", alpha = 0.5) +
  geom_line(aes(y = `Expected Inflation`), color = "red") +
  geom_line(aes(y = `Actual Inflation`), color = "blue") +
  scale_color_manual(name = "Legend",
                     values = c("Expected Inflation" = "red",
                                "Actual Inflation" = "blue"))
chart_2




#




# end



