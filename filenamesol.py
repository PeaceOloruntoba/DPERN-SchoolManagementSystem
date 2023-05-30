import scipy.stats as stats

# Set the rate parameter (λ) for the exponential distribution
rate_parameter = 1/10

# Calculate the probability of waiting for less than 5 minutes
probability_less_than_5 = stats.expon.cdf(5, scale=1/rate_parameter)
print(f"Probability of waiting for less than 5 minutes: {probability_less_than_5:.4f}")

# Calculate the probability of waiting for greater than or equal to 10 minutes
probability_greater_than_equal_10 = 1 - stats.expon.cdf(10, scale=1/rate_parameter)
print(f"Probability of waiting for greater than or equal to 10 minutes: {probability_greater_than_equal_10:.4f}")

# Calculate the probability of waiting between 5 and 10 minutes
probability_between_5_and_10 = stats.expon.cdf(10, scale=1/rate_parameter) - stats.expon.cdf(5, scale=1/rate_parameter)
print(f"Probability of waiting between 5 and 10 minutes: {probability_between_5_and_10:.4f}")


# This code uses the scipy.stats.expon module to calculate the probabilities based on the exponential distribution. The cdf function (cumulative distribution function) is used to calculate the probabilities for different ranges. The scale parameter is set to 1/rate_parameter to match the rate parameter specified in the problem.
# When you run this code, it will output the calculated probabilities for waiting times less than 5 minutes, greater than or equal to 10 minutes, and between 5 and 10 minutes.
