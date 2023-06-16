SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL;
SELECT * FROM persona WHERE YEAR(fecha_nacimiento) = 1983;
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE pr.id_profesor IS NULL AND p.telefono IS NULL AND p.nif LIKE '%D';
SELECT * FROM  asignatura WHERE Bimestre = 1 AND Curso = 2 AND id_grado = 8;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS NombreDepartamento FROM profesor JOIN persona p ON profesor.id_profesor = p.id JOIN departamento d ON profesor.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre AS NombreAsignatura, ce.anyo_inicio AS AnyoInicio, ce.anyo_fin AS AnyoFin FROM persona P JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno JOIN curso_escolar ce ON m.id_curso_escolar = ce.id JOIN asignatura a ON m.id_asignatura = a.id WHERE p.nif = '49329546D';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado Trabajo Social' AND d.id IN (SELECT DISTINCT id_departamento FROM profesor);
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno JOIN curso_escolar ce ON m.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2004 AND ce.anyo_fin = 2008;
SELECT d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN persona p ON pr.id_profesor = p.id ORDER BY nombre_departamento, p.apellido1, p.apellido2, p.nombre;
SELECT * FROM profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE departamento.id IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
SELECT * FROM profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT * FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE profesor.id_profesor IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS alumnos_1983 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1983;
SELECT d.nombre AS departamento, COUNT(p.id) AS cantidad_profesores FROM departamento d INNER JOIN profesor pr ON d.id = pr.id_departamento INNER JOIN persona p ON pr.id_profesor = p.id GROUP BY d.nombre ORDER BY cantidad_profesores DESC;
SELECT d.nombre AS departamento, COUNT(p.id) AS cantidad_profesores FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN persona p ON pr.id_profesor = p.id GROUP BY d.nombre ORDER BY cantidad_profesores DESC;
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SHOW COLUMNS FROM producto;
SELECT nombre, precio, precio * 1.09 AS dollars FROM producto;
SELECT nombre AS "nombre producto", precio AS euros, precio * 1.09 AS dolar FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;