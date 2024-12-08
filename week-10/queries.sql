EXPLAIN
SELECT
    *
FROM
    employees
WHERE
    employee_id = 6;

SELECT
    *
FROM
    employees
WHERE
    employee_id = 6;

SELECT
    *
FROM
    employees
WHERE
    first_name = "David"
    AND last_name = "Bradley";

SELECT
    COUNT(*)
FROM
    employees;

CREATE INDEX idx_first_name ON employees (first_name);

EXPLAIN
SELECT
    *
FROM
    employees
WHERE
    first_name = "David"
    AND last_name = "Bradley";

EXPLAIN
SELECT
    *
FROM
    employees
WHERE
    first_name = "David";

DROP INDEX idx_first_name ON employees;

CREATE INDEX idx_name ON employees (last_name, first_name, middle_name);

-- l_name
-- l_name, f_name
-- l_name, f_name, m_name
