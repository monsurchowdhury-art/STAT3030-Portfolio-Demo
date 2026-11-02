# STAT 3030 - Student Performance Analysis
# University of Georgia
# Demonstration using synthetic student data

library(ggplot2)

set.seed(3030)

# Create synthetic data
students <- data.frame(
  StudyHours = seq(1, 10, length.out = 30)
)

students$ExamScore <- round(
  55 + 3.5 * students$StudyHours +
    rnorm(30, mean = 0, sd = 6),
  1
)

# Descriptive statistics
summary(students)

# Scatterplot with regression line
ggplot(students, aes(x = StudyHours, y = ExamScore)) +
  geom_point(color = "steelblue", size = 3) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Study Hours vs. Exam Scores",
    x = "Study Hours",
    y = "Exam Score"
  ) +
  theme_minimal()

# Fit a linear regression model
model <- lm(ExamScore ~ StudyHours, data = students)

summary(model)
