import sys
import pandas as pd

# First argument corresponds to file
file = open(sys.argv[1], 'r')

# Import csv file into pandas dataframe
df = pd.read_csv(file.name)

df.set_index('PassengerId', inplace=True)
print('Before engineering the features:\n')
print(df.head())

# Split Sex into multiple features (male, female)
male = df.Sex.apply(lambda x: 1 if x == 'male' else 0)
female = df.Sex.apply(lambda x: 1 if x == 'female' else 0)

df.insert(df.columns.get_loc('Sex'), 'male', male)
df.insert(df.columns.get_loc('Sex'), 'female', female)

df.drop('Sex', axis = 1, inplace = True)

# Remove Names, not indicative of survival
df.drop('Name', axis = 1, inplace = True)

# Split Embarked into multiple features depending on (C, Q, S)
embarked_C = df.Embarked.apply(lambda x: 1 if x == 'C' else 0)
embarked_Q = df.Embarked.apply(lambda x: 1 if x == 'Q' else 0)
embarked_S = df.Embarked.apply(lambda x: 1 if x == 'S' else 0)

df.insert(df.columns.get_loc('Embarked'), 'Embarked_C', embarked_C)
df.insert(df.columns.get_loc('Embarked'), 'Embarked_Q', embarked_Q)
df.insert(df.columns.get_loc('Embarked'), 'Embarked_S', embarked_S)

df.drop('Embarked', axis = 1, inplace = True)

# Remove ticket number, as pclass holds same info
df.drop('Ticket', axis = 1, inplace = True)

# Remove cabin number, as pclass/fare holds same info
df.drop('Cabin', axis = 1, inplace = True)

# Move Survived to last column
survival = df.Survived
df.drop('Survived', axis = 1, inplace = True)
df = pd.concat([df, survival], axis = 1)

print('\nAfter engineering the features:\n')
print(df.head())

# Write dataframe back to file
df.to_csv(file.name)

