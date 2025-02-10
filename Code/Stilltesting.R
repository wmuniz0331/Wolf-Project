#Another Test
Y = 2+2
# Generate a random dataset
set.seed(42)  # For reproducibility
data <- data.frame(ID = 1:10,Age = sample(20:60, 10, replace = TRUE),
  Height = round(rnorm(10, mean = 170, sd = 10), 1),
  Weight = round(rnorm(10, mean = 70, sd = 15), 1))
View(data)
