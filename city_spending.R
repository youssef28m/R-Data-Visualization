# Load necessary libraries
library(dplyr)
library(ggplot2)
library(scales)
library(plotly)

# Summarize total spending by city and arrange by total spending in descending order
city_summary <- data %>%
  group_by(city) %>%  # Group by city
  summarize(total_spending = sum(total, na.rm = TRUE)) %>%  # Calculate total spending for each city
  arrange(desc(total_spending))  # Arrange the data by total spending in descending order

# Create a bar plot to visualize total spending by city
plot <- ggplot(city_summary, aes(x = reorder(city, -total_spending), y = total_spending, fill = city)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Spending by City",
       x = "City",
       y = "Total Spending") +
  theme_minimal() +
  scale_y_continuous(
    breaks = seq(0, max(city_summary$total_spending), by = 500000),
    # Define the y-axis breaks from 0 to the maximum total spending in increments of 100,000.

    labels = label_comma()
    # Format the y-axis labels to include commas (e.g., 1,000,000 instead of 1000000).
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for readability

# Convert ggplot to an interactive Plotly plot
plotly_plot <- ggplotly(plot)

# Print the interactive plot
plotly_plot
