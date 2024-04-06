USE tienda;

SELECT p.nombre FROM producto p;

SELECT p.nombre, p.precio FROM producto p;

SELECT * FROM producto;

SELECT p.nombre, p.precio, ROUND(p.precio * 1.08, 2) FROM producto p;

SELECT p.nombre AS nombre_producto, p.precio AS euros, ROUND(p.precio * 1.8, 2) AS dólares FROM producto p;

SELECT UPPER(p.nombre), p.precio FROM producto p;

SELECT LOWER(p.nombre), p.precio FROM producto p;

SELECT DISTINCT f.nombre, UPPER(LEFT(f.nombre, 2)) AS dos_primeros_caracteres  FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;

SELECT p.nombre, ROUND(p.precio, 0) AS precio_redondeado FROM producto p;

SELECT p.nombre, TRUNCATE(p.precio, 0) AS precio_sin_decimal FROM producto p;

SELECT p.codigo_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

SELECT DISTINCT p.codigo_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

SELECT f.nombre FROM fabricante f ORDER BY f.nombre ASC;

SELECT f.nombre FROM fabricante f ORDER BY f.nombre DESC;

SELECT p.nombre, p.precio FROM producto p ORDER BY p.nombre ASC, p.precio DESC;

SELECT * FROM fabricante LIMIT 5;

SELECT * FROM fabricante LIMIT 2 OFFSET 3;

SELECT p.nombre, p.precio FROM producto p ORDER BY p.precio ASC LIMIT 1;

SELECT p.nombre, p.precio FROM producto p ORDER BY p.precio DESC LIMIT 1;

SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.codigo = 2;

SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

SELECT p.codigo AS cod_producto, p.nombre, f.codigo AS cod_fabricante, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

SELECT p.nombre AS nombre_prod, p.precio, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

SELECT p.nombre AS nombre_prod, p.precio, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;

SELECT p.nombre AS nombre_prod, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' UNION SELECT p.nombre, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' UNION SELECT p.nombre, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Seagate';

SELECT p.nombre AS nombre_prod, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE  RIGHT(f.nombre, 1) = 'e';

SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';

SELECT p.nombre AS nombre_prod, p.precio, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

SELECT f.codigo, f.nombre AS nombre_fabr, GROUP_CONCAT(p.nombre SEPARATOR ', ') AS productos FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.codigo, f.nombre;

SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

SELECT * FROM producto p WHERE p.precio = ( SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = ( SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo' ));

SELECT p.nombre FROM producto p WHERE p.precio = (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));

SELECT p.nombre FROM producto p WHERE p.precio = (SELECT MIN(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Hewlett-Packard'));

SELECT * FROM producto p WHERE p.precio >= (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(p.precio) FROM producto p WHERE p.codigo_fabricante = f.codigo);

USE universidad;

SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

SELECT * FROM persona p WHERE p.tipo = 'alumno' AND p.telefono IS NULL;

SELECT * FROM persona p WHERE p.tipo = 'alumno' AND p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

SELECT * FROM persona p WHERE p.tipo = 'profesor' AND p.telefono IS NULL AND RIGHT(p.nif, 1) = 'K';

SELECT * FROM asignatura a WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM profesor pr JOIN persona p ON pr.id_profesor = p.id JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura am JOIN asignatura a ON am.id_asignatura = a.id JOIN curso_escolar ce ON am.id_curso_escolar = ce.id JOIN persona p ON am.id_alumno = p.id WHERE p.tipo = 'alumno' AND p.nif = '26902806M';

SELECT d.nombre FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Ingeniería Informática (Plan 2015)';

SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE ce.anyo_inicio = '2018' AND ce.anyo_fin = '2019';

SELECT d.nombre AS nombre_departamento, p.apellido1 AS primer_apellido, p.apellido2 AS segundo_apellido, p.nombre AS nombre_profesor FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN persona p ON pr.id_profesor = p.id ORDER BY nombre_departamento ASC, primer_apellido ASC, segundo_apellido ASC, nombre_profesor ASC;

SELECT p.id, p.apellido1 AS 'Apellido 1', p.apellido2 AS 'Apellido 2', p.nombre AS 'Nombre' FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL ORDER BY d.nombre ASC;

SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM profesor pr LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor LEFT JOIN persona p ON pr.id_profesor = p.id WHERE a.id IS NULL ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

SELECT a.nombre AS 'Asignatura' FROM asignatura a LEFT JOIN profesor pr ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL ORDER BY a.nombre ASC;

SELECT d.nombre AS 'Departamento' FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.curso IS NULL;

SELECT COUNT(*) AS 'Alumnos Existentes' FROM persona p WHERE p.tipo = 'alumno';

SELECT COUNT(*) AS 'Nacidos en 1999' FROM persona p WHERE p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

SELECT d.nombre AS 'Departamento', COUNT(pr.id_profesor)  AS cantidad_profesores FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id WHERE pr.id_departamento IS NOT NULL GROUP BY d.nombre ORDER BY cantidad_profesores DESC;

SELECT d.nombre AS 'Departamento', COUNT(pr.id_profesor)  AS cantidad_profesores FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY cantidad_profesores DESC;

SELECT g.nombre, COUNT(a.id) cantidad_asignaturas FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre ORDER BY cantidad_asignaturas DESC;

SELECT g.nombre, COUNT(a.id) cantidad_asignaturas FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre HAVING COUNT(a.id) > 40;

SELECT g.nombre AS grado, a.tipo AS tipo_asignatura, SUM(a.creditos) AS credito FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id WHERE a.tipo IS NOT NULL GROUP BY g.nombre, a.tipo;

SELECT ce.anyo_inicio, COUNT(DISTINCT am.id_alumno) AS num_alumnos_matriculados FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar GROUP BY anyo_inicio;

SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS asignaturas FROM profesor pr LEFT JOIN persona p ON p.id = pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor GROUP BY pr.id_profesor ORDER BY asignaturas DESC;

SELECT * FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.fecha_nacimiento ASC LIMIT 1;

SELECT CONCAT(p.apellido1, ' ', p.apellido2, ', ', p.nombre) AS nombre_completo FROM profesor pr JOIN persona p ON pr.id_profesor = p.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pr.id_departamento IS NOT NULL AND a.id IS NULL;