/* Segunda parte do Projeto */

--query que retorna qual estudante fez qual disciplina do próprio orientador.
CREATE TABLE student_course_advisor (
    s_ID INT,
    s_name TEXT,
    i_ID INT,
    i_name TEXT,
    course_id TEXT,
    title TEXT,
    PRIMARY KEY (s_ID, course_id)
);

INSERT INTO student_course_advisor (s_ID, s_name, i_ID, i_name, course_id, title)
VALUES (201, 'Alice Johnson', 101, 'John Smith', 'CS101', 'Introduction to Computer Science');

INSERT INTO student_course_advisor (s_ID, s_name, i_ID, i_name, course_id, title)
VALUES (202, 'Bob Davis', 102, 'Jane Doe', 'MATH101', 'Introduction to Mathematics');

SELECT s_name, i_name, title
FROM student_course_advisor;

--sala (prédio e número) cada professor dá aula
CREATE TABLE professor_room (
    i_ID INT PRIMARY KEY,
    i_name TEXT,
    building TEXT,
    room_number TEXT
);

INSERT INTO professor_room (i_ID, i_name, building, room_number)
VALUES (101, 'John Smith', 'Turing Hall', '101');

INSERT INTO professor_room (i_ID, i_name, building, room_number)
VALUES (102, 'Jane Doe', 'Einstein Building', '201');

SELECT i_name, building, room_number
FROM professor_room;


--nome, orçamento, total de alunos e salário médio de cada departamento
CREATE TABLE department_stats (
    dept_name TEXT PRIMARY KEY,
    budget FLOAT,
    total_students INT,
    avg_instructor_salary FLOAT
);

INSERT INTO department_stats (dept_name, budget, total_students, avg_instructor_salary)
VALUES ('CS', 1000000.0, (SELECT COUNT(*) FROM student WHERE dept_name = 'CS'), (SELECT AVG(salary) FROM instructor WHERE dept_name = 'CS'));

INSERT INTO department_stats (dept_name, budget, total_students, avg_instructor_salary)
VALUES ('Math', 800000.0, (SELECT COUNT(*) FROM student WHERE dept_name = 'Math'), (SELECT AVG(salary) FROM instructor WHERE dept_name = 'Math'));

SELECT dept_name, budget, total_students, avg_instructor_salary
FROM department_stats;
