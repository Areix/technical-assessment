# Introduction

This part of assessment aims at assessing candidates' knowledge in basic programming, logic, experience/capability in data collection, analysis and machine learning.

# Task 1 - Dynamic Programming
A carpenter has collected data on the satisfaction level of his `n` woodwork. Carpenter can make any woodwork in 1 unit of time.

Like-time coefficient of a woodwork is defined as the time taken to make that woodwork including previous woodworks multiplied by its satisfaction level  i.e.  `time[i] * satisfaction[i]`

Return the maximum sum of Like-time coefficient that the carpenter can obtain after woodworks making.

woodworks can be made in any order and the carpenter can discard some woodworks to get this maximum value.


Example 1:
```
Input: satisfaction = [-1,-8,0,5,-9]
Output: 14
Explanation: After Removing the second and last woodwork, the maximum total Like-time coefficient will be equal to (-1*1 + 0*2 + 5*3 = 14).
```
Example 2:
```
Input: satisfaction = [4,3,2]
Output: 20
Explanation: Woodworks can be made in any order, (2*1 + 3*2 + 4*3 = 20)
```
Example 3:
```
Input: satisfaction = [-1,-4,-5]
Output: 0
Explanation: People don't like the woodworks. No woodwork is made.
```
Example 4:
```
Input: satisfaction = [-2,5,-1,0,3,-3]
Output: 35
```

# Task 2 - Stack, Two pointer
Given a list of integers, compute how much water it is able to contain after raining. The width of each bar is 1.

<img src='https://s3.ap-south-1.amazonaws.com/afteracademy-server-uploads/trapping-rain-water.png' width="250" height="120" />

The above graph is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

Example:
```
Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
```

# Task 3 - Data Collection
1. Please formulate an efficient plan to collect mutual fund data, and preferably program the codes in any preferred language. 
    - The methods to collect data:
        1. Web scraping
        2. APIs 
        3. Any other methods that you are comfortable with.
2. Please consolidate the data from at least 2 different data sources and integrate into one output with JSON format.
3. Please briefly describe how you will deploy your work and schedule the work on monthly basis.


# Task 4 - Machine Learning
Build a machine learning model to predict the the label. Please implement the data pre-processing and data visualizaion before training the model. The training dataset and test dataset are provided. Please complete this assessment either in jupyter notebook or google colab and enclose the link in your README.

And you are required to answer the following questions:

1. What kinds of data pre-processing techniques you have applied in this task? and why?
2. What kinds of machine learning algorithm you have tried in this task?
3. Which methods perform the best in this task? and why?
4. How would you deal with the lack of training data in this task?
5. How would you handle an imbalanced dataset in this task?
6. How would you perform hyperparameter tuning/optimization in this task?
6. How would you evaluate the model in this task?