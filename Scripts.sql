/*Primeira parte do Projeto. Banco escolhido: wide-colum storage*/

--keyspace no Cassandra
CREATE KEYSPACE university_keyspace
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

--usa o keyspace
USE university_keyspace;

--armazena os dados do department
CREATE TABLE department (
    dept_name TEXT PRIMARY KEY,
    building TEXT,
    budget FLOAT
);

--armazena os dados do instructor
CREATE TABLE instructor (
    ID INT PRIMARY KEY,
    name TEXT,
    dept_name TEXT,
    salary FLOAT
);

--armazena os dados do student
CREATE TABLE student (
    ID INT PRIMARY KEY,
    name TEXT,
    dept_name TEXT,
    tot_cred INT
);

--armazena os dados do course
CREATE TABLE course (
    course_id TEXT PRIMARY KEY,
    title TEXT,
    dept_name TEXT,
    credits INT
);

--armazena os dados da section
CREATE TABLE section (
    course_id TEXT,
    sec_id TEXT,
    semester TEXT,
    year INT,
    building TEXT,
    room_number TEXT,
    time_slot_id TEXT,
    PRIMARY KEY (course_id, sec_id, semester, year)
);

--armazena os dados do time slot
CREATE TABLE time_slot (
    time_slot_id TEXT PRIMARY KEY,
    day TEXT,
    start_hr INT,
    start_min INT,
    end_hr INT,
    end_min INT
);

--armazena os dados da relação teaches
CREATE TABLE teaches (
    ID INT,
    course_id TEXT,
    sec_id TEXT,
    semester TEXT,
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year)
);

--armazena os dados da relação takes
CREATE TABLE takes (
    ID INT,
    course_id TEXT,
    sec_id TEXT,
    semester TEXT,
    year INT,
    grade TEXT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year)
);

--armazena os dados da relação advisor
CREATE TABLE advisor (
    s_ID INT PRIMARY KEY,
    i_ID INT
);

--armazena os dados agregados para cada departamento
CREATE TABLE department_summary (
    dept_name TEXT PRIMARY KEY,
    budget FLOAT,
    total_students INT,
    total_salary FLOAT
);
