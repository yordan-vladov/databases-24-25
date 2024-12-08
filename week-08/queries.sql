SELECT
    *
FROM
    employees
WHERE
    salary = (
        SELECT
            MAX(salary)
        FROM
            employees
    );

SELECT
    *
FROM
    employees
WHERE
    salary = (
        SELECT
            MIN(salary)
        FROM
            employees
    );

SELECT
    *
FROM
    employees
WHERE
    salary > (
        SELECT
            AVG(salary)
        FROM
            employees
    );

SELECT
    *
FROM
    employees
WHERE
    department_id IN (
        SELECT
            department_id
        FROM
            departments
        WHERE
            name = "Sales"
    );

SELECT
    *
FROM
    employees
WHERE
    employee_id IN (
        SELECT DISTINCT
            manager_id
        FROM
            employees
    );

SELECT
    *
FROM
    employees
WHERE
    address_id IN (
        SELECT
            address_id
        FROM
            addresses
        WHERE
            town_id IN (
                SELECT
                    town_id
                FROM
                    towns
                WHERE
                    name = "Sofia"
            )
    );

SELECT
    *
FROM
    projects
WHERE
    project_id NOT IN (
        SELECT DISTINCT
            project_id
        FROM
            employees_projects
    );

SELECT
    *
FROM
    employees
WHERE
    (department_id, manager_id) IN (
        SELECT
            department_id,
            manager_id
        FROM
            departments
        WHERE
            name = 'Sales'
    );
