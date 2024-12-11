
# Load necessary libraries
library(ggplot2)  # For creating visualizations
library(dplyr)    # For data manipulation
library(scales)   # For formatting scales (e.g., adding commas to numbers)
library(plotly)

# Read the CSV file into a data frame
data <- read.csv("grc.csv")


# Summarize total spending by age
age_summary <- data %>%
  group_by(age) %>%  # Group the data by the 'age' column
  summarize(total_spending = sum(total, na.rm = TRUE))
# Calculate the total spending for each age, ignoring missing values (NA).

# Create a bar plot
plot <- ggplot(age_summary, aes(x = age, y = total_spending)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  # Create a bar chart where the height of the bars corresponds to `total_spending`.
  # The bars are colored with "steelblue".

  labs(title = "Total Spending by Age",
       x = "Age",
       y = "Total Spending") +
  # Add titles and labels to the plot. The main title is set to "Total Spending by Age".
  # The x-axis is labeled "Age", and the y-axis is labeled "Total Spending".

  theme_minimal() +
  # Apply a minimal theme to the plot for a clean, simple appearance.

  scale_x_continuous(breaks = unique(age_summary$age)) +
  # Ensure the x-axis displays every unique age value from the `age_summary` data frame.

  scale_y_continuous(
    breaks = seq(0, max(age_summary$total_spending), by = 100000),
    # Define the y-axis breaks from 0 to the maximum total spending in increments of 100,000.

    labels = label_comma()
    # Format the y-axis labels to include commas (e.g., 1,000,000 instead of 1000000).
  )

# Convert ggplot to an interactive Plotly plot
plotly_plot <- ggplotly(plot)

# Print the interactive plot
plotly_plot



















