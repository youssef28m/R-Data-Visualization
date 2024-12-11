# Load necessary libraries
library(dplyr)
library(ggplot2)
library(scales)
library(plotly)

# Summarize total spending by payment type (Cash vs Credit)
payment_summary <- data %>%
  group_by(paymentType) %>%
  summarize(total_spending = sum(total, na.rm = TRUE))

# Create a pie chart
ggplot(payment_summary, aes(x = "", y = total_spending, fill = paymentType)) +
  geom_bar(stat = "identity", width = 1, color = "white") +  # Create the pie chart bars
  coord_polar(theta = "y") +  # Convert bar chart into a pie chart
  labs(title = "Total Spending by Payment Type") +
  scale_fill_manual(values = c("Cash" = "steelblue", "Credit" = "#5BBC9B")) +  # Color customization
  theme_void() +  # Remove axis and background
  # Add labels for total spending on each slice
  geom_text(aes(label = paste(paymentType, "\n", label_comma()(total_spending))),
            position = position_stack(vjust = 0.5), color = "white", size = 5)

