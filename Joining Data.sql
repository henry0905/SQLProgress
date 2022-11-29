--- INNER JOIN
SELECT left.id as match_id,
left.field as data1,
right.field as data2,
FROM left_table AS left
INNER JOIN right_table as right
USING (id);

--- BASIC EXAMPLE
SELECT c.code AS country_code, c.name, e.year, e.inflation_rate
FROM countries AS c
  -- Join to economies (alias e)
  INNER JOIN economies as e
    -- Match on code
    ON e.code = c.code;
 
    -- Or we can use
    USING (code);

--- SELF JOIN
-- Select fields with aliases
SELECT p1.country_code,
       p1.size AS size2010, 
       p2.size AS size2015,
       -- Calculate growth_perc
       ((p2.size - p1.size)/p1.size * 100.0) AS growth_perc
-- From populations (alias as p1)
FROM populations AS p1
  -- Join to itself (alias as p2)
  INNER JOIN populations AS p2
    -- Match on country code
    ON p1.country_code = p2.country_code
        -- and year (with calculation)
        AND p1.year = p2.year - 5;
