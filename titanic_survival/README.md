# Titanic Surival: Regularized Logistic Regression

Here's how I did this program:

I did this program after three weeks of
[Andrew Ng's Machine Learning Course](https://www.coursera.org/learn/machine-learning/)
on Coursera.

First off, I downloaded the dataset from
[Kaggle's website](https://www.kaggle.com/c/titanic).

## Data Manipulation/Cleaning

This time, I didn't want to make the same mistake with the Titanic dataset as I
had with the House Prices dataset. Namely, I wanted to make sure I kept as many
unique features as possible, and to keep track of my changes to the dataset.

To accomplish this, I used [Pandas](http://pandas.pydata.org/), a popular data
analysis library. I followed a
[Youtube series by sentdex](https://www.youtube.com/watch?v=Iqjy9UqKKuo&list=PLQVvvaa0QuDc-3szzjeP6N6b0aDrrKyL-)
to get me acquainted with the library.

I started manipulating my dataset by splitting some features into multiple
features. For example, I split the `Sex` feature in the original dataset into
`male` and `female` versions. So while originally a passenger had a `Sex`
feature set to `male|female`, the passenger would now have a `male` and a
`female` feature set to `1|0`. This allowed me to input data that seemed
initially significant into a form that wouldn't mess with my feature weights.

I did a similar change to the `Embarked` feature which originally had values
`C|Q|S`.

I also removed the names of the passengers, as I didn't think that it was
indicative of whether or not a passenger survives. (I still don't know the
best technique for changing words, like a name, into a number that could be
input to my learning algorithm.)

Lastly, I removed the `Ticket` numbers and `Cabin` numbers as the data set was
sparse in these columns and the `pclass` and `fare` features held similar
information with much more consistency.

### To be continued

