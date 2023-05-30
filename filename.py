# Make sure you have the numpy library installed before running this code. It calculates the desired probabilities based on the rate parameter and generates a random number from the exponential distribution.

import numpy as np

# Set the rate parameter (λ) for the exponential distribution
rate_parameter = 1/10

# Calculate the probability of waiting for less than 5 minutes
probability_less_than_5 = 1 - np.exp(-rate_parameter * 5)
print(f"Probability of waiting for less than 5 minutes: {probability_less_than_5:.4f}")

# Calculate the probability of waiting for greater than or equal to 10 minutes
probability_greater_than_equal_10 = np.exp(-rate_parameter * 10)
print(f"Probability of waiting for greater than or equal to 10 minutes: {probability_greater_than_equal_10:.4f}")

# Calculate the probability of waiting between 5 and 10 minutes
probability_between_5_and_10 = np.exp(-rate_parameter * 5) - np.exp(-rate_parameter * 10)
print(f"Probability of waiting between 5 and 10 minutes: {probability_between_5_and_10:.4f}")

# Generate a random number from the exponential distribution
random_number = np.random.exponential(scale=1/rate_parameter)
print(f"Random number from the exponential distribution: {random_number:.4f}")
