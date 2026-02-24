# Sales Forecasting Project

# Load dataset
data <- read.csv(file.choose())

# Convert date column
data$Order_Date <- as.Date(data$Order_Date)

# Create month column
data$Month <- format(data$Order_Date, "%Y-%m")

# Aggregate monthly sales
monthly_sales <- aggregate(Revenue ~ Month, data = data, sum)

# Convert to time series
ts_sales <- ts(monthly_sales$Revenue, frequency = 12)

# Load forecast library
library(forecast)

# Build ARIMA model
model <- auto.arima(ts_sales)

# Forecast next 6 months
forecast_sales <- forecast(model, h = 6)

# Plot forecast
plot(forecast_sales,
     main = "Sales Forecast for Next 6 Months",
     xlab = "Month",
     ylab = "Revenue")