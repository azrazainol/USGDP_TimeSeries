# Time Series

INTRODUCTION

Forecasting is a technique used by many businesses and organisations to get an idea of the future. There are three approaches to forecasting. The first approach is the judgemental methods or qualitative models. This method uses the opinions of people who are experts in a certain field. It focuses more on basing a forecast on the experience and knowledge of these experts which makes it a subjective approach with no reliance on statistical data. This approach has the benefit of being able to look into qualitative factors which are usually not detected by data. Some of the factors may include market trends, politics and advancement of technology. This method is usually combined with quantitative methods. Methods for this approach include the Delphi method, jury of executive opinion and consumer market survey.

The second approach is the time series methods. Time series methods use data that is collected over a period of time. The data is used to forecast the future by looking at trends and patterns in the change of the values in the data. Some methods for time series are smoothing, decomposition and Auto Regressive Integrated Moving Average (ARIMA).

The third and last approach is the causal method which is a method that uses many factors that may affect the factor to forecast. Instead of looking into the variable to be forecasted only, such as in the time series approach, the causal method approach looks at the possible variables that may influence the future outcome. This method is typically employed using regression analysis.


TIME SERIES

This study will be carrying out methods from the time series approach, namely the smoothing, decomposition and time trend methods. The software being used to carry out the analysis is RStudio.

A time series data is a type of data that contains observations that are recorded sequentially over a period of time which usually has equal intervals such as yearly, monthly, weekly intervals. In most cases, a time series data contains data of only one variable. Each observation in a time series data indicates a value at a certain point in time. An example would be the weight of a giraffe measured monthly over the span of 5 years. Other examples are market sales, stock prices and the birthrate of a country. The sequence of a time series data is what allows the analysis of trends, and patterns against time. 

The empirical study we are looking at contains the data of the United State’s gross domestic product (US GDP) from the year 1947 until 2020 with quarterly intervals. The dataset is retrieved from Kaggle at the link: https://www.kaggle.com/datasets/kapatsa/modelled-time-series

When forecasting using time series data, it is important to create a good forecast. A good forecast model foremost is a model that could be easily understood by stakeholders who would need the information to create decisions for a company. A good model also has a low cost while also being able to forecast reliably with maximum accuracy. A good model should be able to take into account the uncertainty in real life. It takes a few trial and errors to achieve the best model for forecasting. In the empirical study done, the time series methods mentioned earlier would be employed and compared to view which model is the best for our data.


TIME SERIES METHODS

Three time series methods will be shown applied to our US GDP dataset. The three methods are the decomposition method, the smoothing methods and the time trend methods. Each of these methods provide different purposes and the choice of which method to use depends on the objective of the study or forecast. 

Firstly, carrying out decomposition on a time series data means to separate the different components of a time series data. Time series data can be composed of components showing seasonal changes, trend, and other irregular components called residuals or random. Before doing decomposition analysis, it is best to identify whether the data is additive or multiplicative. Checking the variance of the data by plotting the values could give an idea on the seasonal change. A constant variance suggests an additive time series data meanwhile a decreasing or increasing variance suggests a multiplicative data. The actual difference between an additive time series and a multiplicative time series data is that additive data adds up linearly meanwhile multiplicative data multiplies with itself. This is why when plotted, the variance of an additive data is constant but the multiplicative data keeps on increasing or decreasing.

![6C490414-AE78-45E0-B7AA-956ABB6E6750](https://github.com/user-attachments/assets/2369b0e6-ab18-444d-bb16-49a4e090cd37)

The US GDP data shows increasing variance which shows that the seasonal change is multiplicative. After identifying the seasonal pattern, the decomposition analysis is carried out by decomposing the multiplicative time series.

![07107449-5EFE-4C5F-AEEE-B9DC1F08FF17](https://github.com/user-attachments/assets/debbafc2-854f-449c-bf97-32eaac6fa732)

Decomposition is similar to the exploratory data analysis (EDA) of time series data. It gives an idea of the data structure. As observed in the plot above, there are the components mentioned earlier: trend, seasonal and random. 

Based on the plot, the trend seems to be non-linear. Although there is an increase, the increase does not indicate a direct relationship between the variable and time. The use of identifying the trend will be shown later in the time trend analysis.

The next part is the seasonal plot. The seasonal plot shows a constant seasonal change throughout time. It shows that the seasonal fluctuations are predictable and remain relatively stable over time. A constant seasonal change makes it easier for the modeling process as the forecasters can use methods that assume a regular seasonal pattern.

The final part is the random plot. This plot portrays the parts in the data that could not be explained by the trend pattern or the seasonal pattern. The fluctuations in the random plot account for the uncertainty of the data. Less fluctuations means more stable data and more fluctuations means that the random plot is capturing most of the unpredictability in the data. A balance of both is ideal to avoid overfitting or underfitting a model onto the data. The residuals should be random and have a mean of zero. The random component typically contains the cyclical pattern of the data. A cyclical pattern is a repeated pattern over time but the repetition does not occur in regular intervals like seasonal patterns. This is why it is included in the random section because it is considered irregular.

The random plot shown above from the data US GDP seems to have a decrease followed by an increase pattern. The parts with varying values are at the beginning of the plot and the end of the plot which is assumed to be due to external factors such as the Covid-19 outbreak in 2020. The next part of the analysis, smoothing analysis, will proceed regardless.

To conclude, the decomposition analysis displays the underlying structure of the data. The separation of the components makes it easier for researchers to perform analysis and forecast.


SMOOTHING ANALYSIS

The next part of the analysis is the smoothing analysis. Unlike decomposition which separates the parts of a time series data to analyse the components separately, smoothing is a method that removes short term fluctuations in the data to uncover the underlying long term trend of the data. This helps the model that will be created from the smoothed data to focus on the actual trend rather than being distracted by the inconsistencies of the random parts in the data.

There are many smoothing methods that could be applied to a time series data. Some of the most common ones are the exponential smoothing method, the moving average method and Holt-Winter’s smoothing method. These will all be covered in the analysis.

The first smoothing analysis to be applied is the moving average method which can be considered the most simple method among the three. It is easily understood and easily computed due to its simplicity. This method simply retrieves the values within equal intervals or windows, for example every 4 points, then calculates the average to smooth out fluctuations. The window could be of different sizes depending on the data. Due to the method, the moving average is less responsive to sudden changes in the data. An example of the moving average smoothing method applied to the US GDP data is shown below.

![1B2EBC91-01C1-4CD0-9580-B01C26606894](https://github.com/user-attachments/assets/a169dd78-589b-48b3-8042-77f121e9b996)

The top plot is the original time series plot and the bottom plot is the smoothed data using the moving average method. The bottom plot has a smoother line compared to the top plot because it has gone through smoothing with a window of 4. The window size is the most important in the moving average smoothing method. It usually requires trial and error to get the best window. A larger window size would result in a more smoothed data and plot but would also cause the forecasts produced from the smoothed data to respond slower to changes in trend due to the high lag. Lag in the context of time series means the period of time in between. For example, the lag between yesterday and today is a 1 day lag.

After removing the short term fluctuations, the smoothed data may be used to forecast future values. It should be noted that the moving average method is only best for stable data. For the moving average model created using the US GDP data, the MAD is ​​38,032.08 which is pretty high considering that the mean of the data is 1,599,439.

![6D3236C6-47F3-47E5-A0E6-2527DB483E10](https://github.com/user-attachments/assets/1a47e97a-5ffc-44f8-b55d-343a41d1be56)

The plot above shows the forecasted values that are indicated by the blue line with the lower and upper intervals in grey. Even without forecasting knowledge, one can tell that the forecast is not so accurate. This indicates that the number of lags or the method used for smoothing is not suitable for the data. The number of lags could be changed or other methods could be employed instead. Due to that, other methods are tried to carry out smoothing on the data.

The next smoothing method to be used is the exponential smoothing method. This method is not as straightforward as the moving average method and is pretty flexible in detecting short-term changes. What this method does in comparison to the moving average is, while still taking into account the older observations, it decreases the weights of older points in the data and gives more relevance to newer points by giving more weight to it. The weight is the value ‘alpha’ and this is crucial information in exponential smoothing. Each time a new forecast is done, the last forecast is weighted down by deducting it with the the alpha value times its error. Deciding the alpha value requires trial and error until the lowest mean absolute deviation (MAD) or also called mean absolute error (MAE) in the context of forecasting. An example is shown below using the US GDP data.

![33CBFA19-DE64-4CED-B019-852625B82AE5](https://github.com/user-attachments/assets/76cdea99-1f90-4d94-9204-2b190da61176)

The alpha in the model created controls the weight of the recent observations. The alpha in the model, 0.8083, is high and gives a lot of weight to the most recent data point which causes the model to respond quickly to recent changes in the data. This quick reaction to recent changes also causes it to overreact to the slightest changes making the model volatile

Next is the MAE value. A lower MAE value is considered good as it means that the smoothed points are closer to the mean or median of the data. Checking the scale of the data is important to determine whether the MAE value is low. The mean of the data is 1,599,439 which is in millions. The MAE is 13,999 which is about 0.88% of the mean. This is a relatively low MAE considering the scale of the data. However, the model provided as an example above only uses the maximum likelihood estimation (MLE) to estimate the best alpha value. By trying other alpha values manually, it may be possible to find a lower MAE.

The next part for exponential smoothing analysis is to forecast using the exponential smoothing method. The plot for the smoothed data by the exponential smoothing method is shown below.

![440AF16F-AAF4-4199-96EF-002558BBBBAC](https://github.com/user-attachments/assets/8d6da44b-b96b-4a2e-955f-b61e22eddd4f)

The next plot shows the points of the forecasted values by the exponential smoothing in blue with the lower and upper boundaries in grey.

![9E651C2B-EDEC-404A-8B13-6B2F9DA31BF6](https://github.com/user-attachments/assets/7f8d7bb1-f240-41c1-9a95-df3247c22ece)

Compared to the moving average smoothing method, the forecast by the exponential smoothing method makes more sense with the seasonal changes also included in the forecast. However, this model only forecasts values based on the smoothed data. It is a great model but depending on the data, extending it to consider both trend and seasonal changes would be optimal.

That brings the study to the final smoothing method which is the Holt-Winter’s smoothing method. In comparison to the exponential smoothing method, this method is like an extension to the exponential smoothing method. The Holt-Winter method still does exponential smoothing but it also takes into account the trend and seasonality of the data. This also means that this model is the most complex among the three smoothing models. The details for this model are shown below.

![5505BB19-581F-43A8-BAFB-62648D8CC256_4_5005_c](https://github.com/user-attachments/assets/4af21bba-a9f1-4505-8f87-886580531078)

The alpha that weighs the recent values for exponential smoothing is 0.6189. It is relatively high as it considers the most recent value about 62% while the rest of the weight is distributed along the rest of the data. Again, this means that the model is reactive to recent changes in data. After calculating the mean of the difference between the actual data and the fitted values, the MAE is retrieved. For this specific Holt-Winter model, the MAE is 15,415.42. It is higher than the previous exponential smoothing model but scale-wise, it is not too different at 0.96% of the mean of the data. Next, the plot for the Holt-Winter model is shown below.

![58D21C80-5C20-4C40-91B2-9982601262EC](https://github.com/user-attachments/assets/70493c24-5663-49da-ac21-c462c78b043b)

The plot for forecasted values by the Holt-Winter model is shown below. The forecasted values are in blue and the upper and lower intervals are illustrated in grey. Referring to the plot below, it shows that the lower and upper boundaries of the forecast values are smaller compared to the exponential smoothing forecast value. This can be explained by the complexity of the model. The more complex the model, the more likely it is to produce close to real life value forecasts. It does not mean that the Holt-Winter model is better than the exponential smoothing model. A time series data with a short time span may benefit more from the exponential smoothing method as it is more stable. A time series data with clear trend or seasonal patterns would better suit the Holt-Winter method due to the model considering both of the components.

![FA222605-0290-484B-90FB-DC3C1F849F72](https://github.com/user-attachments/assets/17e53db7-287c-4b1d-a256-df6cc9b24f5b)

To conclude, three common smoothing methods were shown from the simplest to the most complex method. The key differences are the way the methods consider the data observations and the components of the data. The moving average does not put any weight on the recent observations but the exponential smoothing does. The Holt-Winter method on the other hand employs the exponential smoothing method with an addition of considering the trend and seasonal changes in the data. Finally, evaluating each model could be done using the MAD value. A good model has a low MAD value as it means that the fitted values and actual values do not vary a lot.


TIME TREND ANALYSIS

The final analysis for this study is the time trend analysis. The time trend analysis explores the trend of the data. There are many possible approaches to time-trend analysis including the decomposition and smoothing methods earlier. The approach that will be shown in this section is the linear and non-linear time trend analysis. Trends could go upwards, downwards or stable. The linear and non-linear methods are distinct methods and most of the time only one method is suitable for the data. However, for comparison reasons, both will be shown in this section.

When applying the linear trend method, the method assumes that the data is linear. This means that if the data has a line going through the data points, the line should be relatively straight and not curved or irregular. This data type shows a constant change over time. On the other hand, the non-linear trend analysis assumes that the change in the data is irregular which can be indicated by a curve or curved lines when drawing a line through the data points. It requires more sophisticated models to analyse the underlying trend. 

![DC6E141B-D3A8-45C9-8974-CD773C5C8A00](https://github.com/user-attachments/assets/65b1877f-f20e-4312-bda0-fa5e6def28ec)

The linear trend method is applied to the US GDP data and the plot is shown above. The linear trend line indicated by the red line clearly deviates a lot from the actual points. The linear trend method fails to explain the data because the data is non-linear data and shows an increasing curve trend. Due to that, the non-linear method is utilised so that the method could capture the varying change.

![CA36AEF7-34F3-4331-B218-AF2664DADB44](https://github.com/user-attachments/assets/0bd79296-0da9-431e-9c27-8c45cc8b1f0c)

The plot above shows the non-linear method applied to the US GDP data. This time, the red line is closer to the actual values in the data. The non-linear trend method captures the trend better than the linear trend method.

Overall, the time trend is also based off of the decomposition analysis where the trend is visualised to see the underlying trend of the data. It is possible to forecast using the time trend analysis but it will only consider the trend of the data like how the exponential smoothing only considers the long term trend too.


CONCLUSION

To conclude, time series data is a great source to receive insights for the future. Understanding how to apply and understand the methods that could be used on a time series data is useful to make use of the data to its fullest potential. Modeling using complex methods without understanding its pros and cons would not yield great results. This is why it is important to know the criteria of a good model which is a model that is simple yet still manages to provide accurate and reliable results. In time series forecasting, the MAD measure and the simplicity of a model are the two guides that could help achieve a good model.

