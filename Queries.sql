/* Segunda parte do Projeto */

--query que retorna qual estudante fez qual disciplina do próprio orientador.
SELECT s.name AS student_name, i.name AS instructor_name, c.title AS course_title
FROM student s
JOIN advisor a ON s.ID = a.s_ID
JOIN instructor i ON a.i_ID = i.ID
JOIN takes t ON s.ID = t.ID
JOIN section sec ON t.course_id = sec.course_id AND t.sec_id = sec.sec_id AND t.semester = sec.semester AND t.year = sec.year
JOIN course c ON sec.course_id = c.course_id
WHERE i.ID = a.i_ID;

--sala (prédio e número) cada professor dá aula
SELECT i.name AS instructor_name, sec.building, sec.room_number
FROM instructor i
JOIN teaches t ON i.ID = t.ID
JOIN section sec ON t.course_id = sec.course_id AND t.sec_id = sec.sec_id AND t.semester = sec.semester AND t.year = sec.year;

--nome, orçamento, total de alunos e salário médio de cada departamento
INSERT INTO department_summary (dept_name, budget, total_students, total_salary)
SELECT dept_name, SUM(budget) AS budget, COUNT(*) AS total_students, AVG(salary) AS total_salary
FROM department d
JOIN student s ON d.dept_name = s.dept_name
JOIN instructor i ON d.dept_name = i.dept_name
GROUP BY dept_name;
SELECT dept_name, budget, total_students, total_salary
FROM department_summary;


