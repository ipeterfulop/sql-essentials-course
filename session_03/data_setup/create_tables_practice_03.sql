CREATE SCHEMA IF NOT EXISTS practice_03;
SET SEARCH_PATH TO practice_03;

CREATE TABLE practice_03.business_units
(
    id                  serial PRIMARY KEY,
    name                text NOT NULL,
    activity_start_date date NOT NULL
);

CREATE TABLE practice_03.bands
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(255) NOT NULL,
    next_band_id INTEGER
);

CREATE TABLE practice_03.job_titles
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE practice_03.countries
(
    code         VARCHAR PRIMARY KEY,
    name         VARCHAR,
    continent    VARCHAR,
    region       VARCHAR,
    surface_area REAL,
    indep_year   INTEGER,
    local_name   VARCHAR,
    gov_form     VARCHAR,
    capital      VARCHAR,
    cap_long     REAL,
    cap_lat      REAL
);

CREATE TABLE practice_03.languages
(
    id       INTEGER PRIMARY KEY,
    code     VARCHAR,
    name     VARCHAR,
    percent  REAL,
    official BOOLEAN
);

CREATE TABLE practice_03.employees
(
    id                            SERIAL PRIMARY KEY,
    first_name                    VARCHAR(25) NOT NULL,
    middle_name                   VARCHAR(25),
    last_name                     VARCHAR(25) NOT NULL,
    hire_date                     DATE        NOT NULL,
    birth_date                    DATE        NOT NULL,
    business_unit_id              INTEGER,
    lead_employee_id              INTEGER REFERENCES employees (id),
    job_title_id                  INTEGER REFERENCES job_titles (id),
    band_id                       INTEGER REFERENCES bands (id),
    last_salary_review_date       DATE,
    salary                        INTEGER CHECK (salary >= 1500 AND salary <= 5000),
    email_address                 VARCHAR(255) CHECK (email_address LIKE '%@hcl.com'),
    gender                        CHAR(1) CHECK (gender IN ('M', 'F') OR gender IS NULL),
    yearly_leave_days             INTEGER CHECK (yearly_leave_days > 0),
    personal_id_number            VARCHAR(8) CHECK (personal_id_number ~ '^[0-9]{6}[A-Za-z]{2}$'),
    date_of_last_medical_analysis DATE,
    residence_country_id          VARCHAR     NOT NULL,
    native_language_id            INTEGER REFERENCES languages (id),
    preferred_language_id         INTEGER REFERENCES languages (id)
);

-- creating table projects
CREATE TABLE practice_03.projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    start_date DATE DEFAULT NULL,
    completion_date DATE DEFAULT NULL,
    cancellation_date DATE DEFAULT NULL
);


-- creating table project_assignments
CREATE TABLE project_assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    project_id INT REFERENCES projects(id),
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    percentage INT CHECK (percentage BETWEEN 20 AND 100) DEFAULT 20
);