
INSERT INTO practice_02.employees (
    id, first_name, middle_name, last_name, hire_date, birth_date,
    unit_of_work, position, band, last_salary_review_date,
    salary, email_address, gender, yearly_leave_days, personal_id_number,
    date_of_last_medical_analysis, country_of_work, place_of_work
) VALUES
(1, 'Gábor', 'Antal', 'Kovács', TO_DATE('15-05-2021', 'DD-MM-YYYY'), TO_DATE('01-02-1990', 'DD-MM-YYYY'),
'Consulting 1', 'Data engineer', 'Junior1', TO_DATE('15-06-2022', 'DD-MM-YYYY'),
2000, 'gabor.kovacs@hcl.com', 'M', 25, '123456AB',
NULL, 'Hungary', 'Budapest'),

(2, 'Erzsébet', NULL, 'Tóth', TO_DATE('02-03-2020', 'DD-MM-YYYY'), TO_DATE('05-04-1992', 'DD-MM-YYYY'),
'Managed services', 'Manager', 'Senior2', TO_DATE('05-07-2022', 'DD-MM-YYYY'),
3500, 'erzsebet.toth@hcl.com', 'F', 30, '234567BC',
TO_DATE('01-04-2022', 'DD-MM-YYYY'), 'Hungary', 'Debrecen'),

(3, 'Zoltán', 'Péter', 'Szabó', TO_DATE('13-07-2019', 'DD-MM-YYYY'), TO_DATE('10-11-1988', 'DD-MM-YYYY'),
'Team augmentation 1', 'BI developer', 'Medior', TO_DATE('11-08-2022', 'DD-MM-YYYY'),
3000, 'zoltan.szabo@hcl.com', 'M', 32, '345678CD',
NULL, 'Hungary', 'Szeged'),

(4, 'Anikó', 'Ilona', 'Varga', TO_DATE('21-10-2018', 'DD-MM-YYYY'), TO_DATE('09-07-1985', 'DD-MM-YYYY'),
'Team Augmentation 2', 'Data Scientist', 'Senior3', TO_DATE('19-09-2022', 'DD-MM-YYYY'),
4500, 'aniko.varga@hcl.com', 'F', 35, '456789DE',
TO_DATE('15-06-2022', 'DD-MM-YYYY'), 'Hungary', 'Pécs'),

(5, 'József', NULL, 'Nagy', TO_DATE('07-08-2017', 'DD-MM-YYYY'), TO_DATE('06-12-1982', 'DD-MM-YYYY'),
'Consulting 1', 'Data engineer', 'Senior1', TO_DATE('21-10-2022', 'DD-MM-YYYY'),
2500, 'jozsef.nagy@hcl.com', 'M', 22, '567890EF',
NULL, 'Hungary', 'Miskolc'),

      (6, 'John', 'Michael', 'Smith', TO_DATE('15-05-2021', 'DD-MM-YYYY'), TO_DATE('01-02-1990', 'DD-MM-YYYY'),
'Consulting 1', 'Data engineer', 'Junior1', TO_DATE('15-06-2022', 'DD-MM-YYYY'),
2000, 'john.smith@hcl.com', 'M', 25, '123456AB',
NULL, 'USA', 'New York'),

(7, 'Emily', NULL, 'Johnson', TO_DATE('02-03-2020', 'DD-MM-YYYY'), TO_DATE('05-04-1992', 'DD-MM-YYYY'),
'Managed services', 'Manager', 'Senior2', TO_DATE('05-07-2022', 'DD-MM-YYYY'),
3500, 'emily.johnson@hcl.com', 'F', 30, '234567BC',
TO_DATE('01-04-2022', 'DD-MM-YYYY'), 'USA', 'Los Angeles'),

(8, 'Robert', 'James', 'Brown', TO_DATE('13-07-2019', 'DD-MM-YYYY'), TO_DATE('10-11-1988', 'DD-MM-YYYY'),
'Team augmentation 1', 'BI developer', 'Medior', TO_DATE('11-08-2022', 'DD-MM-YYYY'),
3000, 'robert.brown@hcl.com', 'M', 32, '345678CD',
NULL, 'Canada', 'Toronto'),

(9, 'Sophia', 'Grace', 'Taylor', TO_DATE('21-10-2018', 'DD-MM-YYYY'), TO_DATE('09-07-1985', 'DD-MM-YYYY'),
'Team Augmentation 2', 'Data Scientist', 'Senior3', TO_DATE('19-09-2022', 'DD-MM-YYYY'),
4500, 'sophia.taylor@hcl.com', 'F', 35, '456789DE',
TO_DATE('15-06-2022', 'DD-MM-YYYY'), 'Canada', 'Vancouver'),

(10, 'William', NULL, 'Miller', TO_DATE('07-08-2017', 'DD-MM-YYYY'), TO_DATE('06-12-1982', 'DD-MM-YYYY'),
'Consulting 1', 'Data engineer', 'Senior1', TO_DATE('21-10-2022', 'DD-MM-YYYY'),
2500, 'william.miller@hcl.com', 'M', 22, '567890EF',
NULL, 'USA', 'Chicago'),
(11, 'József', 'Béla', 'Kovács', TO_DATE('15-03-2020', 'DD-MM-YYYY'), TO_DATE('12-07-1985', 'DD-MM-YYYY'),
 'Consulting 1', 'Data engineer', 'Medior', TO_DATE('15-03-2022', 'DD-MM-YYYY'),
 3000, 'jozsef@hcl.com', 'M', 25,
 '123456AB', NULL,
 'Hungary', 'Budapest'),

(12, 'Erzsébet', NULL, 'Tóth', TO_DATE('20-05-2019', 'DD-MM-YYYY'), TO_DATE('03-02-1990', 'DD-MM-YYYY'),
 'Managed services', 'Manager', 'Senior1', TO_DATE('20-05-2022', 'DD-MM-YYYY'),
 4000, 'erzsebet@hcl.com', 'F', 30,
 '223456CD', TO_DATE('01-01-2022', 'DD-MM-YYYY'),
 'Hungary', 'Szeged'),

(13, 'Miklós', 'Ferenc', 'Nagy', TO_DATE('10-11-2021', 'DD-MM-YYYY'), TO_DATE('25-09-1995', 'DD-MM-YYYY'),
 'Team augmentation 1', 'BI developer', 'Junior2', TO_DATE('10-11-2022', 'DD-MM-YYYY'),
 2500, 'miklos@hcl.com', 'M', 28,
 '323456EF', NULL,
 'Hungary', 'Debrecen'),

(14, 'Zsófia', 'Katalin', 'Szabó', TO_DATE('05-01-2018', 'DD-MM-YYYY'), TO_DATE('18-04-1988', 'DD-MM-YYYY'),
 'Team Augmentation 2', 'Data Scientist', 'Senior3', TO_DATE('05-01-2022', 'DD-MM-YYYY'),
 4700, 'zsofia@hcl.com', 'F', 35,
 '423456GH', TO_DATE('22-04-2022', 'DD-MM-YYYY'),
 'Hungary', 'Miskolc'),

(15, 'Attila', 'László', 'Horváth', TO_DATE('08-08-2022', 'DD-MM-YYYY'), TO_DATE('14-12-1992', 'DD-MM-YYYY'),
 'Consulting 1', 'Manager', 'Senior2', NULL,
 4500, 'attila@hcl.com', 'M', 22,
 '523456IJ', NULL,
 'Hungary', 'Győr');

INSERT INTO practice_02.employees (
    id, first_name, middle_name, last_name, hire_date, birth_date,
    unit_of_work, lead_employee_id, position, band, last_salary_review_date,
    salary, email_address, gender, yearly_leave_days, personal_id_number,
    date_of_last_medical_analysis, country_of_work, place_of_work
) VALUES
(16, 'Bence', 'Máté', 'Nagy', TO_DATE('01-02-2020', 'DD-MM-YYYY'), TO_DATE('12-03-1990', 'DD-MM-YYYY'), 'Consulting 1', NULL, 'Data engineer', 'Junior1', TO_DATE('01-02-2021', 'DD-MM-YYYY'), 3000, 'bence.nagy@hcl.com', 'M', 25, '123456AB', TO_DATE('11-02-2022', 'DD-MM-YYYY'), 'Hungary', 'Budapest'),
(17, 'Hanna', 'Ildikó', 'Kovács', TO_DATE('05-06-2019', 'DD-MM-YYYY'), TO_DATE('23-07-1985', 'DD-MM-YYYY'), 'Managed services', 16, 'BI developer', 'Medior', TO_DATE('05-06-2021', 'DD-MM-YYYY'), 3500, 'hanna.kovacs@hcl.com', 'F', 30, '234567BC', NULL, 'Hungary', 'Debrecen'),
(18, 'László', NULL, 'Tóth', TO_DATE('15-08-2021', 'DD-MM-YYYY'), TO_DATE('04-05-1992', 'DD-MM-YYYY'), 'Team augmentation 1', 17, 'Manager', 'Senior1', TO_DATE('15-08-2022', 'DD-MM-YYYY'), 4500, 'laszlo.toth@hcl.com', 'M', 22, '345678CD', NULL, 'Hungary', 'Budapest'),
(19, 'Eszter', NULL, 'Szabó', TO_DATE('20-09-2020', 'DD-MM-YYYY'), TO_DATE('30-10-1987', 'DD-MM-YYYY'), 'Team Augmentation 2', 18, 'Data Scientist', 'Senior2', TO_DATE('20-09-2021', 'DD-MM-YYYY'), 4000, 'eszter.szabo@hcl.com', 'F', 35, '456789DE', TO_DATE('03-03-2022', 'DD-MM-YYYY'), 'Hungary', 'Szeged'),
(20, 'Márk', 'Zoltán', 'Horváth', TO_DATE('04-12-2018', 'DD-MM-YYYY'), TO_DATE('18-04-1988', 'DD-MM-YYYY'), 'Consulting 1', 19, 'Data engineer', 'Junior2', TO_DATE('04-12-2021', 'DD-MM-YYYY'), 3200, 'mark.horvath@hcl.com', 'M', 28, '567890EF', NULL, 'Hungary', 'Budapest'),
(21, 'Katalin', 'Anna', 'Varga', TO_DATE('22-11-2019', 'DD-MM-YYYY'), TO_DATE('13-01-1986', 'DD-MM-YYYY'), 'Managed services', 20, 'BI developer', 'Medior', TO_DATE('22-11-2021', 'DD-MM-YYYY'), 3800, 'katalin.varga@hcl.com', 'F', 29, '678901FG', TO_DATE('15-04-2022', 'DD-MM-YYYY'), 'Hungary', 'Pécs'),
(22, 'Gábor', NULL, 'Fekete', TO_DATE('03-10-2020', 'DD-MM-YYYY'), TO_DATE('22-02-1995', 'DD-MM-YYYY'), 'Team augmentation 1', 21, 'Manager', 'Senior3', TO_DATE('03-10-2021', 'DD-MM-YYYY'), 4700, 'gabor.fekete@hcl.com', 'M', 24, '789012GH', NULL, 'Hungary', 'Győr');

INSERT INTO practice_02.employees (id, first_name, middle_name, last_name, hire_date, birth_date, unit_of_work, lead_employee_id, position, band, last_salary_review_date, salary, email_address, gender, yearly_leave_days, personal_id_number, date_of_last_medical_analysis, country_of_work, place_of_work)
VALUES
(26, 'Béla', 'András', 'Nagy', TO_DATE('15-07-2021', 'DD-MM-YYYY'), TO_DATE('25-04-1985', 'DD-MM-YYYY'), 'Consulting 1', 16, 'Data engineer', 'Junior1', TO_DATE(NULL, 'DD-MM-YYYY'), 2200, 'bela.nagy@hcl.com', 'M', 30, '123456AB', TO_DATE('10-03-2022', 'DD-MM-YYYY'), 'Hungary', 'Budapest'),
(27, 'Zsuzsanna', 'Mária', 'Kovács', TO_DATE('12-09-2021', 'DD-MM-YYYY'), TO_DATE('18-12-1990', 'DD-MM-YYYY'), 'Consulting 2', 14, 'BI developer', 'Junior2', TO_DATE(NULL, 'DD-MM-YYYY'), 1900, 'zsuzsanna.kovacs@hcl.com', 'F', 28, '987654CD', TO_DATE(NULL, 'DD-MM-YYYY'), 'Hungary', 'Debrecen'),
(28, 'Gergő', 'Péter', 'Tóth', TO_DATE('08-05-2022', 'DD-MM-YYYY'), TO_DATE('06-11-1987', 'DD-MM-YYYY'), 'Managed services', 16, 'Manager', 'Medior', TO_DATE(NULL, 'DD-MM-YYYY'), 2800, 'gergo.toth@hcl.com', 'M', 25, '456789EF', TO_DATE('20-07-2022', 'DD-MM-YYYY'), 'Hungary', 'Szeged'),
(29, 'Márton', 'Bence', 'Varga', TO_DATE('23-11-2022', 'DD-MM-YYYY'), TO_DATE('14-03-1995', 'DD-MM-YYYY'), 'Team augmentation 1', 14, 'Data Scientist', 'Senior1', TO_DATE(NULL, 'DD-MM-YYYY'), 4000, 'marton.varga@hcl.com', 'M', 22, '654321GH', TO_DATE('15-05-2022', 'DD-MM-YYYY'), 'Hungary', 'Pécs'),
(30, 'Eszter', 'Anna', 'Kiss', TO_DATE('05-04-2021', 'DD-MM-YYYY'), TO_DATE('29-09-1983', 'DD-MM-YYYY'), 'Team Augmentation 2', 16, 'Data engineer', 'Senior2', TO_DATE(NULL, 'DD-MM-YYYY'), 3500, 'eszter.kiss@hcl.com', 'F', 35, '789012IJ', TO_DATE(NULL, 'DD-MM-YYYY'), 'Hungary', 'Budapest');

INSERT INTO practice_02.employees (id, first_name, middle_name, last_name, hire_date, birth_date, unit_of_work, lead_employee_id, position, band, last_salary_review_date, salary, email_address, gender, yearly_leave_days, personal_id_number, date_of_last_medical_analysis, country_of_work, place_of_work)
VALUES
    (31, 'Gábor', 'Ádám', 'Kovács', TO_DATE('01-03-2021', 'DD-MM-YYYY'), TO_DATE('15-06-1990', 'DD-MM-YYYY'), 'Consulting 1', 16, 'Data engineer', 'Junior1', NULL, 3000, 'gabor.kovacs1@hcl.com', 'M', 30, '123456AB', TO_DATE(NULL, 'DD-MM-YYYY'), 'Hungary', 'Budapest'),
    (32, 'Katalin', 'Éva', 'Nagy', TO_DATE('15-07-2019', 'DD-MM-YYYY'), TO_DATE('10-05-1985', 'DD-MM-YYYY'), 'Consulting 2', 14, 'BI developer', 'Junior2', TO_DATE('15-09-2022', 'DD-MM-YYYY'), 2500, 'katalin.nagy@hcl.com', 'F', 28, '987654CD', TO_DATE('01-05-2023', 'DD-MM-YYYY'), 'Hungary', 'Debrecen'),
    (33, 'Bence', 'Gábor', 'Szabó', TO_DATE('05-12-2020', 'DD-MM-YYYY'), TO_DATE('20-11-1991', 'DD-MM-YYYY'), 'Managed services', 16, 'Manager', 'Medior', NULL, 3800, 'bence.szabo@hcl.com', 'M', 25, '345678EF', TO_DATE('10-08-2022', 'DD-MM-YYYY'), 'Hungary', 'Szeged'),
    (34, 'Emese', 'Noémi', 'Farkas', TO_DATE('22-09-2018', 'DD-MM-YYYY'), TO_DATE('05-03-1980', 'DD-MM-YYYY'), 'Team augmentation 1', 14, 'Data Scientist', 'Senior1', TO_DATE('20-11-2022', 'DD-MM-YYYY'), 4800, 'emese.farkas@hcl.com', 'F', 35, '654321GH', TO_DATE('05-07-2023', 'DD-MM-YYYY'), 'Hungary', 'Pécs'),
    (35, 'Zoltán', 'Péter', 'Kiss', TO_DATE('12-02-2017', 'DD-MM-YYYY'), TO_DATE('18-09-1982', 'DD-MM-YYYY'), 'Team Augmentation 2', 16, 'BI developer', 'Senior2', NULL, 4500, 'zoltan.kiss@hcl.com', 'M', 22, '789012IJ', TO_DATE(NULL, 'DD-MM-YYYY'), 'Hungary', 'Miskolc'),
    (36, 'Anikó', 'Judit', 'Tóth', TO_DATE('10-04-2019', 'DD-MM-YYYY'), TO_DATE('25-12-1987', 'DD-MM-YYYY'), 'Consulting 1', 14, 'Data Scientist', 'Senior3', TO_DATE('05-10-2022', 'DD-MM-YYYY'), 4900, 'aniko.toth@hcl.com', 'F', 32, '567890KL', TO_DATE('15-03-2022', 'DD-MM-YYYY'), 'Hungary', 'Győr'),
    (37, 'Máté', 'István', 'Varga', TO_DATE('03-11-2021', 'DD-MM-YYYY'), TO_DATE('08-08-1993', 'DD-MM-YYYY'), 'Consulting 2', 16, 'Manager', 'Senior4', TO_DATE('25-11-2022', 'DD-MM-YYYY'), 5000, 'mate.varga@hcl.com', 'M', 30, '234567MN', TO_DATE('20-06-2023', 'DD-MM-YYYY'), 'Hungary', 'Eger'),
    (38, 'Eszter', 'Zsófia', 'Kovács', TO_DATE('25-06-2020', 'DD-MM-YYYY'), TO_DATE('12-04-1995', 'DD-MM-YYYY'), 'Managed services', 14, 'BI developer', 'Medior', NULL, 2800, 'eszter.kovacs@hcl.com', 'F', 24, '456789OP', TO_DATE(NULL, 'DD-MM-YYYY'), 'Hungary', 'Nyíregyháza'),
    (39, 'László', 'Sándor', 'Papp', TO_DATE('17-08-2022', 'DD-MM-YYYY'), TO_DATE('02-10-1989', 'DD-MM-YYYY'), 'Team augmentation 1', 16, 'Manager', 'Junior1', NULL, 3200, 'laszlo.papp@hcl.com', 'M', 26, '345678QR', TO_DATE(NULL, 'DD-MM-YYYY'), 'Hungary', 'Kaposvár'),
    (40, 'Réka', 'Noémi', 'Török', TO_DATE('14-01-2023', 'DD-MM-YYYY'), TO_DATE('30-07-1994', 'DD-MM-YYYY'), 'Team Augmentation 2', 14, 'Data engineer', 'Junior2', NULL, 2700, 'reka.torok@hcl.com', 'F', 31, '678901ST', TO_DATE(NULL, 'DD-MM-YYYY'), 'Hungary', 'Szombathely');

UPDATE practice_02.employees SET lead_employee_id=14 WHERE id<14;