SELECT `apellido1`, `apellido2`, `nombre` FROM `persona` WHERE tipo LIKE '%alumno%' ORDER BY  apellido1,apellido2,nombre ASC;
SELECT `nombre`, `apellido1`, `apellido2` FROM `persona` WHERE tipo LIKE '%alumno%' AND telefono IS NULL;
SELECT `nombre`, `apellido1`, `apellido2`,`tipo` FROM `persona`  WHERE YEAR(fecha_nacimiento) = 1999   AND tipo LIKE '%alumno%'	
SELECT `nombre`, `apellido1`, `apellido2` FROM `persona` WHERE telefono IS NULL  AND tipo LIKE '%profesor%' AND nif LIKE '%K';	
SELECT `nombre`, `cuatrimestre`, `curso`, `id_grado` FROM `asignatura` WHERE cuatrimestre LIKE 1 AND curso LIKE 3 AND id_grado LIKE 7;	
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS departamento FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT asignatura.nombre,  curso_escolar.anyo_inicio, curso_escolar.anyo_fin, persona.nif FROM persona JOIN  alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE persona.nif = '26902806M';
SELECT departamento.nombre FROM `departamento` JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.id = 4 GROUP BY departamento.nombre;
SELECT DISTINCT persona.nombre, persona.apellido1   FROM `alumno_se_matricula_asignatura`  RIGHT JOIN persona on alumno_se_matricula_asignatura.id_alumno = persona.id WHERE id_curso_escolar LIKE 5;
// LEFT OR RIGHT
SELECT departamento.nombre as nombre_departamento, persona.apellido1 , persona.apellido2, persona.nombre FROM `profesor` LEFT JOIN departamento ON profesor.id_departamento = departamento.id LEFT JOIN persona ON profesor.id_profesor = persona.id WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT persona.nombre FROM `profesor` LEFT JOIN departamento ON profesor.id_departamento = departamento.id LEFT JOIN persona ON profesor.id_profesor = persona.id WHERE departamento.id IS NULL
SELECT departamento.nombre FROM `departamento` LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM `profesor` LEFT JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT asignatura.nombre as nombre_asignatura  FROM `asignatura` LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE profesor.id_profesor IS NULL ;
SELECT departamento.nombre as nombre_departamento FROM `departamento` LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN curso_escolar ON asignatura.curso = curso_escolar.id WHERE asignatura.id_profesor IS NULL ;
//resum
SELECT COUNT(*) FROM `persona` WHERE tipo = 'alumno';
SELECT COUNT(*) as numero_alumnos_nacidos_1999 FROM `persona` WHERE tipo = 'alumno' AND YEAR (fecha_nacimiento)=1999;
SELECT departamento.nombre ,COUNT(profesor.id_profesor) as numero_profesores FROM `departamento` JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id, departamento.nombre ORDER BY numero_profesores DESC;
SELECT departamento.nombre ,COUNT(profesor.id_profesor) as numero_profesores FROM `departamento` LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id, departamento.nombre ;
SELECT grado.nombre, COUNT(asignatura.id) as asignaturas_asociadas FROM `grado`  LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id, grado.nombre ORDER BY  asignaturas_asociadas DESC; // (DOBLE CHECK)