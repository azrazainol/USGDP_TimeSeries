setwd("/Users/macbookair/Desktop/STQS4444 Time Series and Forecasting")
library(forecast)
library(zoo)

# Convert to time series
usgdp <- read.csv("GDPUS_nsa.csv")
gdp_ts <- ts(data = usgdp$NA000334Q, start = c(1947, 1), frequency = 4)

# decompose analysis
plot(gdp_ts, main = "US GDP", xlab = "Date", ylab = "Value")
#dec_usgdp <- decompose(gdp_ts)
dec_usgdp_m <- decompose(gdp_ts, type = "multiplicative")
#plot(dec_usgdp)
plot(dec_usgdp_m)

## exponential smoothing analysis
exp_smooth_model <- ets(gdp_ts)
plot(exp_smooth_model$states[,"l"], main = "Exponential Smoothing", ylab = "Value")
plot(forecast(exp_smooth_model))
summary(exp_smooth_model)
accuracy(exp_smooth_model)

alpha_value <- exp_smooth_model$par["alpha"]
alpha_value

# Forecast future values
future_dates <- seq(max(time(gdp_ts)) + 1, length = 4, by = 1)
forecast_values <- forecast(exp_smooth_model, h = length(future_dates))
mad_value <- mean(abs(forecast_values$residuals))
mad_value

# Plot the forecast values
plot(gdp_ts, main = "Exponential Smoothing Forecast", xlab = "Date", ylab = "Value")
lines(forecast_values$mean, col = "red", lty = 1, lwd = 2)

# plot alternative for forecast values
plot(forecast(exp_smooth_model), col = "darkgrey", main = "Exponential Smoothing Forecast")
# lines(exp_smooth_model$states[,"l"], col = "red", lty = 1, lwd = 1)
lines(exp_smooth_model$fitted, col = rgb(1, 0, 0, alpha = 0.5), lty = 1)

plot(exp_smooth_model$fitted, main = "Exponential Smoothing", ylab = "Value")

###### moving average smoothing method #########
# Calculate a 4-period (quarterly) moving average
moving_average <- rollmean(gdp_ts, k = 4, align = "right", fill = NA)
plot(forecast(moving_average), col = "white")
lines(gdp_ts, col = "darkgrey", lty = 1, lwd = 1)
lines(moving_average, col = "red", lty = 1, lwd = 1)
legend("topleft", legend = c("Original", "4-Period Moving Average"), col = c("darkgrey","red"), lty = c(1,1))

ma_fitted <- forecast(moving_average)
ma_absolute_errors <- abs(gdp_ts - ma_fitted$fitted)
mad <- mean(ma_absolute_errors, na.rm = TRUE)
#################


######### holt winters smoothing method ###############
# Fit Holt-Winters smoothing model
holt_winters_model <- HoltWinters(gdp_ts)
fitted_values <- as.vector(fitted(holt_winters_model))
fitted_ts <- ts(fitted_values, start = start(gdp_ts), frequency = frequency(gdp_ts))
str(fitted_ts)
fitted2 <- window(fitted_ts, end = c(2019, 4))


plot(forecast(holt_winters_model), col = "darkgrey")
# lines(holt_winters_model$fitted[,"level"], col = "red")
lines(holt_winters_model$fitted[,"xhat"], col = rgb(1, 0, 0, alpha = 0.5))

# lines(fitted2, col = "red", lty = 1, lwd = 1)
legend("topleft", legend = c("Original", "Holt-Winters Smoothed"), col = c("darkgrey", "red"), lty = 1)

forecast_values <- forecast(holt_winters_model)


## get MAD value for Holt-Winter model
# Calculate the absolute difference between actual and forecasted values
absolute_errors <- abs(gdp_ts - forecast_values$fitted)
mad <- mean(absolute_errors, na.rm = TRUE)

############################


## time trend analysis
# Plot the trend component
plot(gdp_ts, main = "Time Trend Analysis", xlab = "Date", ylab = "Value", col = "black")
lines(dec_usgdp$trend, col = "red", lty = 2, lwd = 2)
legend("topleft", legend = "Trend", col = "red", lty = 2, lwd = 2)

# Plot other components if needed (seasonal and random)
# lines(dec_usgdp$seasonal, col = "blue", lty = 2)
# lines(dec_usgdp$random, col = "green", lty = 2)

######## linear time trend analysis ###########
time_var <- seq(1947, 2021, length.out = length(gdp_ts))
linear_model <- lm(gdp_ts ~ time_var)
fitted_values <- predict(linear_model)
normalized_fitted_values <- fitted_values * (max(gdp_ts) - min(gdp_ts)) / (max(fitted_values) - min(fitted_values))

plot(gdp_ts, main = "Non-linear Time Trend Analysis", xlab = "Date", ylab = "Value")
lines(time_var, normalized_fitted_values, type = "l", col = "red", lty = 1)
legend("topleft", legend = "Linear Trend", col = "red", lty = 1)

##### non-linear time trend analysis ###########
time_var <- seq(1947, 2021, length.out = length(gdp_ts))
quadratic_model <- lm(gdp_ts ~ poly(time_var, 2, raw = TRUE))
fitted_values <- predict(quadratic_model)

plot(gdp_ts, main = "Non-linear Time Trend Analysis", xlab = "Date", ylab = "Value")
lines(time_var, fitted_values, type = "l", col = "red", lty = 1)
legend("topleft", legend = "Non-linear Trend", col = "red", lty = 1)

####################

nar_model <- nnetar(gdp_ts)

# Forecast using the NAR model
nar_forecast <- forecast(nar_model, h = 20)

# Plot the original time series and the forecast
plot(gdp_ts, main = "NAR Forecast", xlab = "Date", ylab = "Value")
lines(nar_forecast$mean, col = "blue", lty = 2)


