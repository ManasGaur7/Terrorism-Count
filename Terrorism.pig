data = LOAD '/home/manas/Downloads/Datasets/terror.csv' USING PigStorage(',');
filtered = FOREACH data GENERATE $1 AS year, $8 AS country;
filtered1 = FILTER filtered BY country=='Iraq';
group1 = GROUP filtered1 BY year;
indivitual_country = FOREACH group1 GENERATE group AS year, COUNT($1) AS COUNT;
DUMP indivitual_country;
