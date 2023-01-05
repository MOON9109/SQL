import pandas as pd

import sqlalchemy
from sqlalchemy import create_engine
df=pd.DataFrame()
engine = create_engine("postgresql://airflow_user:airflow_pass@localhost:5432/airflow_db")



# make a sample DataFrame


score = pd.DataFrame({

        'date': ['2019-07-28']*4,

        'name': ['kim', 'lee', 'choi', 'park'],

        'age': [19, 20, 19, 20],

        'math_score': [91, 95, 92, 70],

        'pass_yn': [True, True, True, False]},

         columns=['date', 'name', 'age', 'math_score', 'pass_yn'])
engine.execute("DROP TABLE IF EXISTS public.score;") # drop table if exists

score.to_sql(name = 'score',

             con = engine,

             schema = 'public',

             if_exists = 'fail', # {'fail', 'replace', 'append'), default 'fail'

             index = True,

             index_label = 'id',

             chunksize = 2,

             dtype = {

                     'id': sqlalchemy.types.INTEGER(),

                     'date': sqlalchemy.DateTime(),

                     'name': sqlalchemy.types.VARCHAR(100),

                     'age': sqlalchemy.types.INTEGER(),

                     'math_score': sqlalchemy.types.Float(precision=3),

                     'pass_yn': sqlalchemy.types.Boolean()

                     })
