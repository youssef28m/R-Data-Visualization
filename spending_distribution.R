# Load required library
library(ggplot2)

# Create a histogram to visualize the distribution of total spending
plot <- ggplot(data, aes(x = total)) +
  geom_histogram(binwidth = 100, fill = "steelblue", color = "black") +
  labs(
    title = "Distribution of Total Spending",
    x = "Total Spending",
    y = "Count"
  ) +
  scale_x_continuous(
    breaks = seq(0, max(data$total), by = 200),

  ) +
  scale_y_continuous(
    breaks = seq(0, max(500), by = 50),
  )

plotly_plot <- ggplotly(plot)

plotly_plot


