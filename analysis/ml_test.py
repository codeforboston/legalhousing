import psycopg2 as pg
import numpy
import pandas.io.sql as psql
from sklearn.feature_extraction.text import CountVectorizer


# get connected to the database
connection = pg.connect(database="housing_data_server_development", host="localhost")

dataframe = psql.read_sql_query("SELECT id, description FROM listings", connection)
count_vectorizer = CountVectorizer()
counts = count_vectorizer.fit_transform(dataframe['description'].values)
print(dataframe.columns.values)
