--  Set the search_path to the practice_01 schema.
-- Page: 21
-- Solution:
\c user7_db; -- remove this line if your database client application does not support it
SET search_path TO practice_01;
SELECT
	content
FROM
	messages;


-- Let us identify the other tables prepared for our initial practice session.
-- Page: 22
-- Solution:
SELECT
	table_name
FROM
	information_schema.tables
WHERE
	table_schema = 'practice_01'
	AND table_type = 'BASE TABLE'
	AND table_catalog = current_database();

-- Let's examine the columns of the employees tables identified by the preceding query.
-- Page: 23
-- Solution:
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE (table_schema = 'practice_01')
  AND table_name = 'employees';

-- Task: Let use discover the current schema and set the search path after.
-- Page: 24
-- Solution:
SELECT current_schema;
SET search_path TO practice_01, public;
SHOW SEARCH_PATH;