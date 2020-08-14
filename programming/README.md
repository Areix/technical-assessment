# Introduction

This part of assessment aims for

# Task 1 - Dynamic Programming
Alice and Bob take turns playing a game, with Alice starting first.

Initially, there are n stones in a pile.  On each player's turn, that player makes a move consisting of removing any non-zero square number of stones in the pile.

Also, if a player cannot make a move, he/she loses the game.

Given a positive integer n. Return True if and only if Alice wins the game otherwise return False, assuming both players play optimally.

Example 1:
```
Input: n = 1
Output: true
Explanation: Alice can remove 1 stone winning the game because Bob doesn't have any moves.
```
Example 2:
```
Input: n = 2
Output: false
Explanation: Alice can only remove 1 stone, after that Bob removes the last one winning the game (2 -> 1 -> 0).
```
Example 3:
```
Input: n = 4
Output: true
Explanation: n is already a perfect square, Alice can win with one move, removing 4 stones (4 -> 0).
```
Example 4:
```
Input: n = 7
Output: false
Explanation: Alice can't win the game if Bob plays optimally.
If Alice starts removing 4 stones, Bob will remove 1 stone then Alice should remove only 1 stone and finally Bob removes the last one (7 -> 3 -> 2 -> 1 -> 0). 
If Alice starts removing 1 stone, Bob will remove 4 stones then Alice only can remove 1 stone and finally Bob removes the last one (7 -> 6 -> 2 -> 1 -> 0).
```
Example 5:
```
Input: n = 17
Output: false
Explanation: Alice can't win the game if Bob plays optimally.
```

# Task 2 - Stack, Two pointer

Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

![s3]('https://s3.ap-south-1.amazonaws.com/afteracademy-server-uploads/trapping-rain-water.png')

The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

Example:
```
Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
```

# Task 3 - Machine Learning
Build a machine learning model to predict the the label. Please implement the data pre-processing and data visualizaion before training the model. The training set and test set are provided. Please complete this either in jupyter notebook or google colab and enclose the link in your README.md file.

And you are required to answer the following questions:

1. which methods perform the best? and why?
2. 