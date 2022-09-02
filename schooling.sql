SELECT first_name,last_name,classes FROM students
WHERE classes = 5;

SELECT first_name,last_name,date_of_birth FROM students
ORDER BY date_of_birth 
LIMIT 10;

SELECT classes,subject1, subject2 FROM class_subjects
WHERE classes = 3;

SELECT * FROM students
WHERE first_name ILIKE '%a%';

--new database--

ALTER TABLE students RENAME TO student;

ALTER TABLE student
RENAME COLUMN student_id TO id;

RENAME COLUMN classes TO class_id;

ALTER TABLE class_subjects
DROP COLUMN classes,
DROP COLUMN subject1,
DROP COLUMN subject2;

CREATE TABLE class(
	id SERIAL PRIMARY KEY,
    name INTEGER CHECK(name BETWEEN 1 AND 6),
    location VARCHAR(15) NOT NULL
);

INSERT INTO class(location,name) 
VALUES
('Old hall',1),
('Room 1',2),
('Fun room',3),
('Room 7',4),
('New hall',5),
('Room 5',6);

CREATE TABLE subject(
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) UNIQUE,
	textbook VARCHAR(60) NOT NULL
);

INSERT INTO subject ("name",textbook) 
VALUES
('ABC SONG', 'Simple Rhymes for Children'),
('Simple Phonetics','Easy Sound Pronunciation'),
('Mathematics','Introductry Mathematics for Basic School'),
('Science','Science for Basic School'),
('PE','Physical Activity'),
('Basic English','Beginners English for Basic School'),
('Advanced English','Advanced English for Basic School'),
('Yoruba','Yoruba Language for Basic School'),
('Art and Crafts','Crafting and Painting'),
('Verbal Reasoning','Verbal Reasoning'),
('Computer','Introduction to Computing');

ALTER TABLE student
ADD CONSTRAINT fk_class_id FOREIGN KEY (class_id)
REFERENCES class (id);


CREATE TABLE class_subject(
	id SERIAL PRIMARY KEY,
	class_id INTEGER NOT NULL,
	subject_id INTEGER NOT NULL,
	CONSTRAINT fk_class_id FOREIGN KEY (class_id)
		REFERENCES class (id),
	CONSTRAINT fk_subject_id FOREIGN KEY (subject_id)
		REFERENCES subject (id)
);


INSERT INTO class_subject(class_id,subject_id) 
VALUES
(1,1),
(1,5),
(1,9),
(2,2),
(2,10),
(2,5),
(3,5),
(3,2),
(3,3),
(3,6),
(3,10),
(4,5),
(4,4),
(4,3),
(4,10),
(4,11),
(4,6),
(4,14),
(5,3),
(5,10),
(5,5),
(5,14),
(5,11),
(5,7),
(5,4),
(6,5),
(6,10),
(6,13),
(6,12),
(6,8),
(6,7),
(6,3);

SELECT first_name,last_name,class_id FROM student
WHERE class_id = 5;

SELECT first_name,last_name,date_of_birth FROM student
ORDER BY date_of_birth 
LIMIT 10;

SELECT subject.name,class_id FROM class_subject
FULL OUTER JOIN subject
ON subject.id = class_subject.subject_id
WHERE class_subject.class_id = 3;

SELECT * FROM student
WHERE first_name ILIKE '%a%';

SELECT date_of_birth, class_subject.subject_id FROM class_subject
FULL OUTER JOIN student
ON class_subject.class_id = student.class_id
ORDER BY student.date_of_birth DESC
LIMIT 7
;