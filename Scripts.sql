/*Primeira parte do Projeto*/

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

--inserindo na tabela department
INSERT INTO department (dept_name, building, budget) VALUES ('CS', 'Turing Hall', 1000000.0);
INSERT INTO department (dept_name, building, budget) VALUES ('Math', 'Einstein Building', 800000.0);

--inserindo na tabela instructor
INSERT INTO instructor (ID, name, dept_name, salary) VALUES (101, 'John Smith', 'CS', 80000.0);
INSERT INTO instructor (ID, name, dept_name, salary) VALUES (102, 'Jane Doe', 'Math', 75000.0);

--inserindo na tabela student
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES (201, 'Alice Johnson', 'CS', 120);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES (202, 'Bob Davis', 'Math', 110);

--inserindo na tabela course
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('CS101', 'Introduction to Computer Science', 'CS', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('MATH101', 'Introduction to Mathematics', 'Math', 3);


--inserindo na tabela section
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES ('CS101', '001', 'Fall', 2023, 'Turing Hall', '101', '1-1-1');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES ('MATH101', '001', 'Fall', 2023, 'Einstein Building', '201', '1-1-2');

--inserindo na tabela time_slot
INSERT INTO time_slot (time_slot_id, day, start_hr, start_min, end_hr, end_min) VALUES ('1-1-1', 'Monday', 8, 0, 9, 30);
INSERT INTO time_slot (time_slot_id, day, start_hr, start_min, end_hr, end_min) VALUES ('1-1-2', 'Monday', 10, 0, 11, 30);

--inserindo na tabela teaches
INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES (101, 'CS101', '001', 'Fall', 2023);
INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES (102, 'MATH101', '001', 'Fall', 2023);

--inserindo na tabela takes
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES (201, 'CS101', '001', 'Fall', 2023, 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES (202, 'MATH101', '001', 'Fall', 2023, 'B');

--inserindo na tabela advisor
INSERT INTO advisor (s_ID, i_ID) VALUES (201, 101);
INSERT INTO advisor (s_ID, i_ID) VALUES (202, 102);
