# House Prices: Linear Regression and Gradient Descent

I did this "Getting Started" Competition on Kaggle because I decided that
simply studying Machine Learning through a course would not give me adequate
experience in applying ML to practical projects.

Here's how I did this program:

I did this program after two weeks of
[Andrew Ng's Machine Learning Course](https://www.coursera.org/learn/machine-learning/)
on Coursera.

First off, I downloaded the dataset from
[Kaggle's website](https://www.kaggle.com/c/house-prices-advanced-regression-techniques#description).

As I started looking through the `train.csv` file, I saw that some of the
features were not numbers, but in fact words or letters, which I didn't know
how to quantify in my data. I decided to remove the complex qualified data, and
convert the simple characters to integers, (e.g. y/n => 1/0).

Unfortunately, I completed this process in Google Sheets, and did not keep
track of which columns I deleted and which columns I converted. Because of this
reason, I decided to remove the `test.csv` and split the training data into
90/10 percent chunks.

Now that I had my data imported and cleaned, I could move on to my actual
algorithm.

## Feature Normalization

My first step was to normalize my features. (Features ranged from values on the
magnitude of [](http://latex.codecogs.com/svg.latex?10^-2) to
[](http://latex.codecogs.com/svg.latex?10^3).)

