CREATE SCHEMA IF NOT EXISTS practice_02;
SET SEARCH_PATH TO practice_02;

CREATE TABLE practice_02.employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    middle_name VARCHAR(25),
    last_name VARCHAR(25) NOT NULL,
    hire_date DATE NOT NULL,
    birth_date DATE NOT NULL,
    business_unit_id INTEGER,
    lead_employee_id INTEGER REFERENCES employees(id),
    position VARCHAR(25) CHECK (position IN ('Data engineer', 'BI developer', 'Manager', 'Data Scientist')),
    band VARCHAR(15) CHECK (band IN ('Junior1', 'Junior2', 'Medior', 'Senior1', 'Senior2', 'Senior3', 'Senior4')),
    last_salary_review_date DATE,
    salary INTEGER CHECK (salary >= 1500 AND salary <= 5000),
    email_address VARCHAR(255) CHECK (email_address LIKE '%@hcl.com'),
    gender CHAR(1) CHECK (gender IN ('M', 'F') OR gender IS NULL),
    yearly_leave_days INTEGER CHECK (yearly_leave_days > 0),
    personal_id_number VARCHAR(8) CHECK (personal_id_number ~ '^[0-9]{6}[A-Za-z]{2}$'),
    date_of_last_medical_analysis DATE,
    residence_country_id INTEGER NOT NULL,
    native_language_id INTEGER NOT NULL,
    preferred_language_id INTEGER
);

