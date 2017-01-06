# bs-stock-simulator
A simple stock simulator in Matlab

You should download the prices of stocks you want to model from Yahoo Finance, as a .csv file.

The table(1).csv is there as an example of DB historical prices, if you put it in the same folder as your .m file it should work.

The improved version "least squares" estimates the drift parameter using the least squares method. Note that you'll have to determine the volatility parameter yourself still, but your choice of sigma will be easily verified by running the program and seeing if the sample paths resemble the actual price path.

In the improved version, your .csv file named "table.csv" will be automatically converted to arrays.

A new version using "stochastic volatility" based on the Heston Model is coming soon.
