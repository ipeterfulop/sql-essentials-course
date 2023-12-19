CREATE SCHEMA IF NOT EXISTS capstone;
SET SEARCH_PATH TO capstone;

CREATE TABLE capstone.business_units
(
    id                  serial PRIMARY KEY,
    name                text NOT NULL,
    activity_start_date date NOT NULL
);

CREATE TABLE capstone.bands
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(255) NOT NULL,
    next_band_id INTEGER
);

CREATE TABLE capstone.job_titles
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE capstone.countries
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

CREATE TABLE capstone.languages
(
    id       INTEGER PRIMARY KEY,
    code     VARCHAR,
    name     VARCHAR,
    percent  REAL,
    official BOOLEAN
);

CREATE TABLE capstone.employees
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

CREATE TABLE capstone.customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);


-- creating table projects
CREATE TABLE capstone.projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    start_date DATE DEFAULT NULL,
    completion_date DATE DEFAULT NULL,
    cancellation_date DATE DEFAULT NULL,
    customer_id INT REFERENCES customers(id)
);


-- creating table project_assignments
CREATE TABLE capstone.project_assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    project_id INT REFERENCES projects(id),
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    percentage INT CHECK (percentage BETWEEN 20 AND 100) DEFAULT 20
);

ALTER TABLE capstone.employees
    ADD CONSTRAINT employees_residence_country_id_fkey
        FOREIGN KEY (residence_country_id)
            REFERENCES countries (code);

CREATE TABLE capstone.activity_categories (
    id SERIAL PRIMARY KEY,
    internal_code CHAR(6) UNIQUE NOT NULL,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE capstone.activity_logs
(
    id SERIAL PRIMARY KEY,
    project_assignment_id INTEGER REFERENCES project_assignments (id),
    activity_category_id INTEGER REFERENCES activity_categories (id),
    date_of_activity DATE NOT NULL,
    hours_worked NUMERIC(3, 2) NOT NULL CHECK (hours_worked > 0 AND hours_worked <= 8),
    hours_billable NUMERIC(3, 2) DEFAULT NULL CHECK ((hours_billable IS NULL) OR (hours_billable >= 0 AND hours_billable <= hours_worked))
);

CREATE TABLE capstone.leave_types
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE capstone.leave_request_statuses
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    is_approved BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE capstone.leave_days
(
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees (id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    leave_type_id INT REFERENCES leave_types (id),
    leave_request_status_id INT REFERENCES leave_request_statuses (id),
    review_date DATE NOT NULL
);

CREATE TABLE capstone.annual_employee_awards(
    employee_id   INTEGER,
    first_name    VARCHAR(25) NOT NULL,
    middle_name   VARCHAR(25),
    last_name     VARCHAR(25) NOT NULL,
    birth_date    DATE        NOT NULL,
    email_address VARCHAR(255) CHECK (email_address LIKE '%@hcl.com'),
    year          INTEGER     NOT NULL CHECK (year BETWEEN 2005 AND 2030),
    award         VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (employee_id, year)
);

ALTER TABLE capstone.annual_employee_awards
    ADD CONSTRAINT annual_employee_awards_employee_id_fkey
        FOREIGN KEY (employee_id)
            REFERENCES employees (id);

CREATE TABLE capstone.expertiseareas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_expertisearea_id INTEGER,
    FOREIGN KEY (parent_expertisearea_id) REFERENCES expertiseareas(id)
);

CREATE TABLE capstone.employee_expertisearea (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    expertisearea_id INTEGER NOT NULL,
    level INTEGER CHECK (level >= 1 AND level <= 5),
    UNIQUE (employee_id, expertisearea_id),
    FOREIGN KEY (expertisearea_id) REFERENCES expertiseareas(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)

);
