
------------CONSULTAS, QUERYS   +   TABLAS

----tablas

CREATE TABLE  estudiantes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT NOT NULL
);


CREATE TABLE  cursos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    duracion INT NOT NULL
);


CREATE TABLE inscripciones(
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN  KEY (id_estudiante) REFERENCES estudiantes(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

---------------------------QUERYYYYYSSSS--------------------------

/*
1)Inserta al menos cinco nuevos estudiantes en la tabla «estudiantes».
*/

INSERT INTO estudiantes (nombre, edad) VALUES
('Antony Brown', 40),
('Anastacia Goodman', 24),
('Kelly Moon', 35),
('Billy Graham', 50),
('Greta Mua', 20);

/* 
2)Inserta al menos cuatro nuevos cursos en la tabla «cursos». 
*/
INSERT INTO cursos (nombre, duracion) VALUES
('Java con Sringboot', 40),
('Aplicaciones Móviles', 30),
('Python con Django', 35),
('Angular vs Vue', 25);

/*
3)Asociar a cuatro de los estudiantes a al menos dos de los cursos dados de alta.
*/

INSERT INTO inscripciones (id_estudiante, id_curso) VALUES
(1,3),
(1,4),
(2,1),
(2,3),
(3,2),
(3,4),
(4,3),
(4,4);


/*
4)Proyecta a todos los estudiantes y sus respectivos cursos.
*/

SELECT estudiantes.nombre AS "ESTUDIANTES", cursos.nombre AS "CURSO"
FROM estudiantes
JOIN inscripciones ON estudiantes.id = inscripciones.id_estudiante
JOIN cursos  ON inscripciones.id_curso = cursos.id;



/*
5)Proyecta todos los estudiantes que están inscritos en un curso específico, 
utilizando el nombre del curso como criterio de búsqueda.
*/

SELECT estudiantes.nombre AS "ESTUDIANTES"
FROM estudiantes
JOIN inscripciones ON estudiantes.id = inscripciones.id_estudiante
JOIN cursos  ON inscripciones.id_curso = cursos.id
WHERE cursos.nombre = 'Python con Django';

/*
6)Proyecta todos los cursos en los que está inscrito un estudiante específico, 
utilizando su nombre como criterio de búsqueda.
*/

SELECT cursos.nombre AS "CURSOS"
FROM cursos
JOIN inscripciones ON cursos.id = inscripciones.id_curso
JOIN estudiantes  ON inscripciones.id_estudiante = estudiantes.id
WHERE estudiantes.nombre = 'Billy Graham';

/*
7)Cuenta el número de estudiantes inscritos en cada curso y 
muestra el nombre del curso junto con el número de estudiantes inscritos.
*/

SELECT cursos.nombre AS "CURSO",
COUNT(inscripciones.id_estudiante) AS "ESTUDIANTES INSCRITOS"
FROM cursos
LEFT JOIN inscripciones ON cursos.id = inscripciones.id_curso
GROUP BY cursos.id, cursos.nombre;

/*
8)Encuentra los estudiantes que no están inscritos en ningún curso.
*/

SELECT estudiantes.nombre AS "ESTUDIANTE"
FROM estudiantes
LEFT JOIN inscripciones
ON estudiantes.id = inscripciones.id_estudiante
WHERE inscripciones.id_estudiante IS NULL;











